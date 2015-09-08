__author__ = 'neowizard'

import sys
from fault_tolerant_conversion import load_problem
from fondparser import parser

OPEN_PRED_NAME = "Open"


class FtComp:
    problem = None
    max_faults = 0

    debug_level = 0
    debug_names = ["FATAL",  # Debug level 0
                   "Error",  # Debug level 1
                   "Warning",  # Debug level 2
                   "Info",  # Debug level 3
                   "Debug"  # Debug level 4
                   ]

    def __init__(self, problem_file_path, debug_level=0):
        self.problem = load_problem(problem_file_path)
        self.debug_level = debug_level

    def compile_ft_task(self):

        self.get_max_faults()

        self.compile_predicates()

        self.compile_actions()

        if (self.debug_level >= 4):
            self.problem._export_domain(sys.stdout)

        print("Done!")

    def debug_print(self, message, level=4):
        if (self.debug_level >= level):
            print("{}: {}".format(self.debug_names[level], message))

    def get_max_faults(self):
        max_faults = 0
        while (max_faults < 1):
            try:
                answer = raw_input("Input maximum number of faults (-1 to quit): ")
                max_faults = int(answer)

                if max_faults == -1:
                    exit()
                if max_faults < 1:
                    print "Number of faults must be at least 1."

            except ValueError:
                max_faults = 0
                print "Error: Please input max number of faults as a number (%s)" % str(answer)
        self.max_faults = max_faults

    def compile_predicates(self):
        print("Creating {} replicas for each predicate".format(self.max_faults + 1))

        self.debug_print("Original problem has {} predicates".format(len(self.problem.predicates)))

        replicates = []
        for predicate in self.problem.predicates:
            print("Replicating {}".format(predicate))
            for replica_idx in xrange(0, self.max_faults + 1):
                name = "{}_{}".format(predicate.name, replica_idx)
                replicates.append(parser.Predicate(name, predicate.args))

        self.problem.predicates = replicates

        self.debug_print("Problem with replicates has {} predicates".format(len(self.problem.predicates)))

        print("Creating {} '{}' propositions".format(self.max_faults + 1, OPEN_PRED_NAME))
        open_predicates = []
        for open_idx in xrange(0, self.max_faults + 1):
            name = "{}_{}".format(OPEN_PRED_NAME, open_idx)
            open_predicates.append(parser.Predicate(name, None, []))

        self.problem.predicates += open_predicates

        self.debug_print("{} predicates after adding '{}' predicates"
                         .format(len(self.problem.predicates), OPEN_PRED_NAME))

    def get_replicated_pred(self, predicate, idx):
        return self.get_replica_by_name(predicate.name, idx)

    def get_replica_by_name(self, predicate_name, idx):
        pred_name = "{}_{}".format(predicate_name, idx)
        preds = [pred for pred in self.problem.predicates if pred.name == pred_name]

        assert (len(preds) <= 1)
        if (len(preds) == 0):
            preds = [pred for pred in self.problem.predicates if pred.name == predicate_name]
            assert (len(preds) > 0)

        return preds[0]

    def compile_actions(self):
        orig_actions_len = len(self.problem.actions)
        print("Creating {} action to replace the original {} actions"
              .format(orig_actions_len * (self.max_faults + 1), orig_actions_len))

        compiled_actions = []
        for action in self.problem.actions:
            compiled_action = self.compile_action(action)
            compiled_actions += compiled_action

        self.problem.actions = compiled_actions

    def compile_action(self, action):
        print("Compiling action: {}".format(action))

        compiled_actions = []

        preconds = self.compile_preconds(action)

        effects = self.compile_effects(action)

        for (action_idx, (precond, effect)) in enumerate(zip(preconds, effects)):
            name = "{}_{}".format(action.name, action_idx)
            compiled_actions.append(parser.Action(name, action.parameters, precond, action.observe, effect))

        return compiled_actions

    def compile_preconds(self, action):
        print("Compiling preconditions for: {}".format(action))

        preconds = []
        for action_idx in xrange(0, self.max_faults+1):
            precond_clone = self.clone_formula(action.precondition)

            self.replace_primitives(precond_clone, action_idx)

            open_name = "{}_{}".format(OPEN_PRED_NAME, action_idx)
            open_pred = self.get_replica_by_name(open_name, action_idx)
            open_precond = parser.Primitive(open_pred)

            close_preconds = []
            for close_idx in xrange(action_idx + 1, self.max_faults + 1):
                close_name = "{}_{}".format(OPEN_PRED_NAME, close_idx)
                close_pred = self.get_replica_by_name(close_name, close_idx)

                close_preconds.append(parser.Not([parser.Primitive(close_pred)]))

            precond = [precond_clone, open_precond, parser.And(close_preconds)]
            preconds.append(parser.And(precond))

        return preconds

    def replace_primitives(self, formula, idx):
        args = []
        for arg in formula.args:
            if (type(arg) == parser.Primitive):
                if (arg.predicate.name == "="):
                    args.append(arg)
                    continue
                old_pred = arg.predicate
                new_pred = self.get_replicated_pred(old_pred, idx)
                args.append(parser.Primitive(new_pred))

            else:
                self.replace_primitives(arg, idx)
                args.append(arg)
        formula.args = args

    def clone_formula(self, formula):
        if (isinstance(formula, parser.Primitive)):
            formula_pred = formula.predicate
            pred = parser.Predicate(formula_pred.name, [(name, obj_type) for (name, obj_type) in formula_pred.args])
            return parser.Primitive(pred)

        elif (isinstance(formula, parser.Or)):
            return parser.Or([self.clone_formula(arg) for arg in formula.args])
        elif (isinstance(formula, parser.And)):
            return parser.And([self.clone_formula(arg) for arg in formula.args])
        elif (isinstance(formula, parser.Xor)):
            return parser.Xor([self.clone_formula(arg) for arg in formula.args])
        elif (isinstance(formula, parser.Not)):
            return parser.Not([self.clone_formula(arg) for arg in formula.args])
        elif (isinstance(formula, parser.Oneof)):
            return parser.Oneof([self.clone_formula(arg) for arg in formula.args])
        elif (isinstance(formula, parser.When)):
            return parser.When(self.clone_formula(formula.condition), self.clone_formula(formula.result))
        elif (isinstance(formula, parser.Forall)):
            return parser.Forall([(name, obj_type) for (name, obj_type) in formula.params],
                                 [self.clone_formula(arg) for arg in formula.args])
        else:
            print("Error: Unknown formula type: {}".format(type(formula)))

    def compile_effects(self, action):
        # TODO (FT compilation): Handle larger branching factors (i.e. more faulty effects)
        print("\nCompiling effects for: {}".format(action))

        primary_effect, faulty_effect = self.get_action_fault_model(action)

        if (faulty_effect is not None):
            self.debug_print("Setting effect {} as primary for action {}".format(primary_effect, action))

        effects = []
        for action_idx in xrange(0, self.max_faults+1):
            if (faulty_effect is not None):
                compiled_effect = self.compile_nondet_effects(action_idx, primary_effect, faulty_effect)
                effects.append(compiled_effect)
            else:
                compiled_effect = self.compile_det_effect(action_idx, primary_effect)
                effects.append(compiled_effect)
        return effects

    @staticmethod
    def get_action_fault_model(action):

        if (not isinstance(action.effect, parser.Oneof)):
            return action.effect, None

        # We can't handle more than 2 possible effects per action yet
        assert ((len(action.effect.args) == 2) or (len(action.effect.args) == 1))

        primary_effect_idx = -1
        print("Select which is the non-faulty (i.e. primary) effect:")
        for effect_idx in xrange(0, len(action.effect.args)):
            print("--- {} ---".format(effect_idx))
            print(action.effect.args[effect_idx])
            print("")
        while (primary_effect_idx < 0 or primary_effect_idx >= len(action.effect.args)):
            answer = None
            try:
                answer = raw_input("Input non-faulty effect index (-1 to quit): ")
                primary_effect_idx = int(answer)

                if primary_effect_idx == -1:
                    exit()
                if primary_effect_idx < 0 or primary_effect_idx >= len(action.effect.args):
                    print("non-faulty effect must be in the range {}-{}".format(0, len(action.effect.args) - 1))

            except ValueError:
                primary_effect_idx = -1
                print("Error: Please input non-faulty effect as an index (input: {})".format(answer))

        primary_effect = action.effect.args[primary_effect_idx]

        faulty_effect = None
        if (len(action.effect.args) == 2):
            faulty_effect = action.effect.args[1 - primary_effect_idx]

        return primary_effect, faulty_effect

    def compile_nondet_effects(self, action_idx, primary_effect, faulty_effect):

        # TODO (FT compilation): Handle larger branching factors (i.e. more faulty effects)
        compiled_primary_eff = self.compile_det_effect(action_idx, primary_effect)

        if (action_idx == self.max_faults):
            return compiled_primary_eff

        effects = [compiled_primary_eff]

        compiled_faulty_eff = self.compile_det_effect(action_idx+1, faulty_effect)
        effects.append(compiled_faulty_eff)

        open_pred = self.get_replica_by_name(OPEN_PRED_NAME, action_idx+1)
        effects.append(parser.Primitive(open_pred))

        return parser.And(effects)

    def compile_det_effect(self, action_idx, effect):

        effect_clone = self.clone_formula(effect)
        self.replace_primitives(effect_clone, action_idx)
        return effect_clone


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print "  Usage: python %s <domain_file_path>\n" % sys.argv[0]
        sys.exit(1)
    compilation = FtComp(sys.argv[1], 4)
    compilation.compile_ft_task()
