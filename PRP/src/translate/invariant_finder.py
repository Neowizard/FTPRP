#! /usr/bin/env python

from __future__ import print_function
from pddl.conditions import Atom

from collections import deque, defaultdict
import itertools
import time
import re

import invariants
import pddl
import timers


class BalanceChecker(object):
    def __init__(self, task, reachable_action_params):
        self.predicates_to_add_actions = defaultdict(set)
        self.action_to_heavy_action = {}
        for act in task.actions:
            action = self.add_inequality_preconds(act, reachable_action_params)
            too_heavy_effects = []
            create_heavy_act = False
            heavy_act = action
            for eff in action.effects:
                too_heavy_effects.append(eff)
                if eff.parameters: # universal effect
                    create_heavy_act = True
                    too_heavy_effects.append(eff.copy())
                if not eff.literal.negated:
                    predicate = eff.literal.predicate
                    self.predicates_to_add_actions[predicate].add(action)
            if create_heavy_act:
                heavy_act = pddl.Action(action.name, action.parameters,
                                        action.num_external_parameters,
                                        action.precondition, too_heavy_effects,
                                        action.cost)
            # heavy_act: duplicated universal effects and assigned unique names
            # to all quantified variables (implicitly in constructor)
            self.action_to_heavy_action[action] = heavy_act

    def get_threats(self, predicate):
        return self.predicates_to_add_actions.get(predicate, set())

    def get_heavy_action(self, action):
        return self.action_to_heavy_action[action]

    def add_inequality_preconds(self, action, reachable_action_params):
        if reachable_action_params is None or len(action.parameters) < 2:
            return action
        inequal_params = []
        combs = itertools.combinations(range(len(action.parameters)), 2)
        for pos1, pos2 in combs:
            for params in reachable_action_params[action]:
                if params[pos1] == params[pos2]:
                    break
            else:
                inequal_params.append((pos1, pos2))

        if inequal_params:
            precond_parts = [action.precondition]
            for pos1, pos2 in inequal_params:
                param1 = action.parameters[pos1].name
                param2 = action.parameters[pos2].name
                new_cond = pddl.NegatedAtom("=", (param1, param2))
                precond_parts.append(new_cond)
            precond = pddl.Conjunction(precond_parts).simplified()
            return pddl.Action(
                action.name, action.parameters, action.num_external_parameters,
                precond, action.effects, action.cost)
        else:
            return action


def get_fluents(task):
    fluent_names = set()
    for action in task.actions:
        for eff in action.effects:
            fluent_names.add(eff.literal.predicate)
    return [pred for pred in task.predicates if pred.name in fluent_names]


def get_initial_invariants(task):
    # FTD specific code
    fault_level_pred_re = re.compile(".*_[1-9]+_[0-9]+$|.*[0-9]+_[1-9]+$")
    # End of FTD code

    for predicate in get_fluents(task):

        # FTD specific code
        # Avoid including FT predicates not on the 0-0 branch level. They will be added after analysis.
        if (task.ftd_domain) and (fault_level_pred_re.match(predicate.name) is not None):
            continue
        # End of FTD code

        all_args = list(range(len(predicate.arguments)))
        for omitted_arg in [-1] + all_args:
            order = [i for i in all_args if i != omitted_arg]
            part = invariants.InvariantPart(predicate.name, order, omitted_arg)
            yield invariants.Invariant((part,))


# Input file might be grounded, beware of too many invariant candidates
MAX_CANDIDATES = 100000
#MAX_TIME = 300 <-- This is now set in the PRP script and passed in as an argument

def find_invariants(task, reachable_action_params):
    candidates = deque(get_initial_invariants(task))
    print(len(candidates), "initial candidates")
    seen_candidates = set(candidates)

    balance_checker = BalanceChecker(task, reachable_action_params)

    def enqueue_func(invariant):
        if len(seen_candidates) < MAX_CANDIDATES and invariant not in seen_candidates:
            candidates.append(invariant)
            seen_candidates.add(invariant)

    start_time = time.clock()
    while candidates:
        candidate = candidates.popleft()
        if time.clock() - start_time > task.INVARIANT_TIME_LIMIT:
            print("Time limit reached, aborting invariant generation")
            return
        if candidate.check_balance(balance_checker, enqueue_func):
            yield candidate


def useful_groups(invariants, task):
    predicate_to_invariants = defaultdict(list)
    for invariant in invariants:
        for predicate in invariant.predicates:
            predicate_to_invariants[predicate].append(invariant)

    # FTD specific code
    if (task.ftd_domain):
        initial_facts = clone_init_to_branches(task.init, task)
    # End of FTD code
    nonempty_groups = set()
    overcrowded_groups = set()
    for atom in initial_facts:
        if isinstance(atom, pddl.Assign):
            continue
        for invariant in predicate_to_invariants.get(atom.predicate, ()):
            group_key = (invariant, tuple(invariant.get_parameters(atom)))
            if group_key not in nonempty_groups:
                nonempty_groups.add(group_key)
            else:
                overcrowded_groups.add(group_key)
    useful_groups = nonempty_groups - overcrowded_groups
    for (invariant, parameters) in useful_groups:
        yield [part.instantiate(parameters) for part in sorted(invariant.parts)]


# FTD specific code
def clone_init_to_branches(init_facts, task):

    ftd_pred_re = re.compile("(.*)_[0-9]+_[0-9]+$")

    max_branch, max_fault = get_FT_parameters(task)

    cloned_facts = []
    for fact in init_facts:
        cloned_facts.append(fact)
        if ((ftd_pred_re.match(fact.predicate) is None) or (fact.predicate.startswith("closed"))):
            continue
        for branch in range(0, max_branch + 1):
            for fault in range(1, max_fault + 1):
                clone_predicate = ftd_pred_re.sub("\\1_{}_{}".format(fault, branch), fact.predicate)
                cloned_facts.append(Atom(clone_predicate, fact.args))

    return cloned_facts
# End of FTD specific code


# FTD specific code
def clone_invariant_to_branches(invariant_list, task):
    """
    Clones the initial facts across all branches of the fault tolerant determinized task
    """

    max_branch, max_fault = get_FT_parameters(task)

    cloned_invariants = []
    ftd_pred_re = re.compile("(.*)_[0-9]+_[0-9]+$")
    for inv in invariant_list:
        cloned_invariants.append(inv)
        for branch in range(0, max_branch + 1):
            for fault in range(1, max_fault + 1):
                cloned_parts = []
                for part in inv.parts:
                    if (ftd_pred_re.match(part.predicate) is None):
                        continue
                    clone_predicate = ftd_pred_re.sub("\\1_{}_{}".format(fault, branch), part.predicate)
                    clone_part = invariants.InvariantPart(clone_predicate,
                                                                 part.order,
                                                                 part.omitted_pos)
                    cloned_parts.append(clone_part)
                cloned_invariants.append(invariants.Invariant(cloned_parts,))

    return cloned_invariants


def get_FT_parameters(task):
    max_fault = 0
    max_branch = 0
    for pred in task.predicates:
        if (pred.name.startswith("closed")):
            branch = int(pred.name[len(pred.name) - 1])
            fault_level = int(pred.name[len(pred.name) - 3])
            if max_branch < branch:
                max_branch = branch
            if max_fault < fault_level:
                max_fault = fault_level
    return max_branch, max_fault


# End of FTD code


def get_groups(task, reachable_action_params=None):
    with timers.timing("Finding invariants", block=True):
        invariants = sorted(find_invariants(task, reachable_action_params))

        # FTD specific code
        if (task.ftd_domain):
            invariants = clone_invariant_to_branches(invariants, task)
        # End of FTD code

    with timers.timing("Checking invariant weight"):
        # FTD-Removed
        # result = list(useful_groups(invariants, task.init))
        # end of FTD-removed
        # FTD specific code
        result = list(useful_groups(invariants, task))
        # End of FTD specific code
    return result


if __name__ == "__main__":
    import normalize

    print("Parsing...")
    task = pddl.open()
    print("Normalizing...")
    normalize.normalize(task)
    print("Finding invariants...")
    print("NOTE: not passing in reachable_action_params.")
    print("This means fewer invariants might be found.")
    for invariant in find_invariants(task, None):
        print(invariant)
    print("Finding fact groups...")
    groups = get_groups(task)
    for group in groups:
        print("[%s]" % ", ".join(map(str, group)))
