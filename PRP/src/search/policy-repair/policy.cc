#include "../operator.h"
#include "../globals.h"
#include "policy.h"

#include <algorithm>
#include <functional>
#include <iostream>
#include <fstream>
#include <vector>
#include <cassert>
using namespace std;

/* NOTE on possible optimizations:

   * Sharing "GeneratorEmpty" instances might help quite a bit with
     reducing memory usage and possibly even speed, because there are
     bound to be many instance of those. However, it complicates
     deleting the successor generator, and memory doesn't seem to be
     an issue. Speed appears to be fine now, too. So this is probably
     an unnecessary complication.

   * Using slist instead of list led to a further 10% speedup on the
     largest Logistics instance, logistics-98/prob28.pddl. It would of
     course also reduce memory usage. However, it would make the code
     g++-specific, so it's probably not worth it.

*/


bool GeneratorSwitch::check_match(const PartialState &curr, bool keep_all) {
    if (immediate_items.size() > 0)
        return true;
    
    if ((curr[switch_var] != -1) && (generator_for_value[curr[switch_var]]->check_match(curr, keep_all)))
        return true;
    
    if ((curr[switch_var] == -1) && keep_all) {
        for (int i = 0; i < g_variable_domain[switch_var]; i++) {
            if (generator_for_value[i]->check_match(curr, keep_all))
                return true;
        }
    }
    
    if (default_generator->check_match(curr, keep_all))
        return true;
    
    return false;
}

void GeneratorSwitch::generate_applicable_items(const PartialState &curr, vector<PolicyItem *> &reg_items, bool keep_all) {
    for (list<PolicyItem *>::iterator op_iter = immediate_items.begin(); op_iter != immediate_items.end(); ++op_iter)
        reg_items.push_back(*op_iter);
    
    if (curr[switch_var] != -1)
        generator_for_value[curr[switch_var]]->generate_applicable_items(curr, reg_items, keep_all);
    else if (keep_all) {
        for (int i = 0; i < g_variable_domain[switch_var]; i++) {
            generator_for_value[i]->generate_applicable_items(curr, reg_items, keep_all);
        }
    }
    
    default_generator->generate_applicable_items(curr, reg_items, keep_all);
}

void GeneratorSwitch::generate_applicable_items(const PartialState &curr, vector<PolicyItem *> &reg_items, int bound) {
    int best_val = 9999999;
    PolicyItem * best_rs = NULL;
    for (list<PolicyItem *>::iterator op_iter = immediate_items.begin(); op_iter != immediate_items.end(); ++op_iter)
    {
        int cur_val = ((RegressionStep *)(*op_iter))->distance;
        if (cur_val < best_val) {
            best_val = cur_val;
            best_rs = *op_iter;
        }
    }
    if (best_val <= bound)
        reg_items.push_back(best_rs);
    
    if (curr[switch_var] == -1) {
        for (int i = 0; i < g_variable_domain[switch_var]; i++) {
            generator_for_value[i]->generate_applicable_items(curr, reg_items, bound);
        }
    } else {
        generator_for_value[curr[switch_var]]->generate_applicable_items(curr, reg_items, bound);
    }
    default_generator->generate_applicable_items(curr, reg_items, bound);
}

bool GeneratorLeaf::check_match(const PartialState &, bool) {
    if (applicable_items.size() > 0)
        return true;
    else
        return false;
}

void GeneratorLeaf::generate_applicable_items(const PartialState &, vector<PolicyItem *> &reg_items, bool) {
    for (list<PolicyItem *>::iterator op_iter = applicable_items.begin(); op_iter != applicable_items.end(); ++op_iter)
        reg_items.push_back(*op_iter);
}

void GeneratorLeaf::generate_applicable_items(const PartialState &, vector<PolicyItem *> &reg_items, int bound) {
    int best_val = 9999999;
    PolicyItem * best_rs = NULL;
    for (list<PolicyItem *>::iterator op_iter = applicable_items.begin(); op_iter != applicable_items.end(); ++op_iter)
    {
        int cur_val = ((RegressionStep *)(*op_iter))->distance;
        if (cur_val < best_val) {
            best_val = cur_val;
            best_rs = *op_iter;
        }
    }
    if (best_val <= bound)
        reg_items.push_back(best_rs);
}



GeneratorSwitch::GeneratorSwitch(int switch_variable,
                                 list<PolicyItem *> &reg_items,
                                 const vector<GeneratorBase *> &gen_for_val,
                                 GeneratorBase *default_gen)
    : switch_var(switch_variable),
      generator_for_value(gen_for_val),
      default_generator(default_gen) {
    
    immediate_items.swap(reg_items);
}

GeneratorSwitch::~GeneratorSwitch() {
    for (int i = 0; i < generator_for_value.size(); i++)
        delete generator_for_value[i];
    delete default_generator;
}

void GeneratorSwitch::dump(string indent) const {
    cout << indent << "switch on " << g_variable_name[switch_var] << endl;
    cout << indent << "immediately:" << endl;
    for (list<PolicyItem *>::const_iterator op_iter = immediate_items.begin();
         op_iter != immediate_items.end(); ++op_iter)
        cout << indent << (*op_iter)->get_name() << endl;
    for (int i = 0; i < g_variable_domain[switch_var]; i++) {
        cout << indent << "case " << i << ":" << endl;
        generator_for_value[i]->dump(indent + "  ");
    }
    cout << indent << "always:" << endl;
    default_generator->dump(indent + "  ");
}

void GeneratorSwitch::generate_cpp_input(ofstream &outfile) const {
    outfile << "switch " << switch_var << endl;
    outfile << "check " << immediate_items.size() << endl;
    for (list<PolicyItem *>::const_iterator op_iter = immediate_items.begin();
         op_iter != immediate_items.end(); ++op_iter)
        outfile << (*op_iter)->get_name() << endl;
    for (int i = 0; i < g_variable_domain[switch_var]; i++) {
        //cout << "case "<<switch_var->get_name()<<" (Level " <<switch_var->get_level() <<
        //  ") has value " << i << ":" << endl;
        generator_for_value[i]->generate_cpp_input(outfile);
    }
    //cout << "always:" << endl;
    default_generator->generate_cpp_input(outfile);
}

GeneratorLeaf::GeneratorLeaf(list<PolicyItem *> &items) {
    applicable_items.swap(items);
}

void GeneratorLeaf::dump(string indent) const {
    for (list<PolicyItem *>::const_iterator op_iter = applicable_items.begin();
         op_iter != applicable_items.end(); ++op_iter)
        cout << indent << (*op_iter)->get_name() << endl;
}

void GeneratorLeaf::generate_cpp_input(ofstream &outfile) const {
    outfile << "check " << applicable_items.size() << endl;
    for (list<PolicyItem *>::const_iterator op_iter = applicable_items.begin();
         op_iter != applicable_items.end(); ++op_iter)
        outfile << (*op_iter)->get_name() << endl;
}

void GeneratorEmpty::dump(string indent) const {
    cout << indent << "<empty>" << endl;
}

void GeneratorEmpty::generate_cpp_input(ofstream &outfile) const {
    outfile << "check 0" << endl;
}


int GeneratorBase::get_best_var(list<PolicyItem *> &reg_items, set<int> &vars_seen) {
    vector< pair<int,int> > var_count = vector< pair<int,int> >(g_variable_name.size());
    
    for (int i = 0; i < g_variable_name.size(); i++) {
        var_count[i] = pair<int,int>(0, i); /*  initialize variables' instance counter */
    }

    /* For every operator in reg_items, increment the counter of all variables affected by it */
    for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); op_iter != reg_items.end(); ++op_iter) {
        for (int i = 0; i < g_variable_name.size(); i++) {
            if (-1 != (*((*op_iter)->state))[i]) {
                var_count[i].first++;
            }
        }
    }
    
    sort(var_count.begin(), var_count.end());
    
    for (int i = var_count.size() - 1; i >= 0; i--) {
        if (vars_seen.count(var_count[i].second) <= 0) {
            //cout << "Best var " << var_count[i].second << " with a count of " << var_count[i].first << endl;
            return var_count[i].second;
        }
    }
    
    assert(false);
    return -1;
}

bool GeneratorBase::reg_item_done(PolicyItem *op_iter, set<int> &vars_seen) {
    for (int i = 0; i < g_variable_name.size(); i++) {
        if ((-1 != (*(op_iter->state))[i]) && (vars_seen.count(i) <= 0))
            return false;
    }
    
    return true;
}

GeneratorBase *GeneratorBase::create_generator(list<PolicyItem *> &reg_items, set<int> &vars_seen) {
    if (reg_items.empty())
        return new GeneratorEmpty;
    
    // If every item is done, then we create a leaf node
    bool all_done = true;
    for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); all_done && (op_iter != reg_items.end()); ++op_iter) {
        if (!(reg_item_done(*op_iter, vars_seen))) {
            all_done = false;
        }
    }
    
    if (all_done) {
        return new GeneratorLeaf(reg_items);
    } else {
        return new GeneratorSwitch(reg_items, vars_seen);
    }
}

GeneratorSwitch::GeneratorSwitch(list<PolicyItem *> &reg_items, set<int> &vars_seen) {
    /* Get a variable from vars_seen that's unaffected by any of the operators in reg_item */
    switch_var = get_best_var(reg_items, vars_seen);
    
    vector< list<PolicyItem *> > value_items;
    list<PolicyItem *> default_items;
    
    /* Initialize the value_items with am empty list of PolicyItems for each possible value of switch_var */
    for (int i = 0; i < g_variable_domain[switch_var]; i++)
        value_items.push_back(list<PolicyItem *>());
    
    for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); op_iter != reg_items.end(); ++op_iter) {
        if (reg_item_done(*op_iter, vars_seen)) {
            immediate_items.push_back(*op_iter);
        } else if (-1 != (*((*op_iter)->state))[switch_var]) {
            value_items[(*((*op_iter)->state))[switch_var]].push_back(*op_iter);
        } else { // == -1
            default_items.push_back(*op_iter);
        }
    }
    
    vars_seen.insert(switch_var);
    
    // Create the switch generators
    for (int i = 0; i < value_items.size(); i++) {
        generator_for_value.push_back(create_generator(value_items[i], vars_seen));
    }
    
    // Create the default generator
    default_generator = create_generator(default_items, vars_seen);
    
    vars_seen.erase(switch_var);
}

GeneratorBase *GeneratorSwitch::update_policy(list<PolicyItem *> &reg_items, set<int> &vars_seen) {
    vector< list<PolicyItem *> > value_items;
    list<PolicyItem *> default_items;
    
    // Initialize the value_items
    for (int i = 0; i < g_variable_domain[switch_var]; i++)
        value_items.push_back(list<PolicyItem *>());
    
    // Sort out the regression items
    for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); op_iter != reg_items.end(); ++op_iter) {
        if (reg_item_done(*op_iter, vars_seen)) {
            immediate_items.push_back(*op_iter);
        } else if (-1 != (*((*op_iter)->state))[switch_var]) {
            value_items[(*((*op_iter)->state))[switch_var]].push_back(*op_iter);
        } else { // == -1
            default_items.push_back(*op_iter);
        }
    }
    
    vars_seen.insert(switch_var);
    
    // Update the switch generators
    for (int i = 0; i < value_items.size(); i++) {
        GeneratorBase *newGen = generator_for_value[i]->update_policy(value_items[i], vars_seen);
        if (NULL != newGen) {
            delete generator_for_value[i];
            generator_for_value[i] = newGen;
        }
    }
    
    // Update the default generator
    GeneratorBase *newGen = default_generator->update_policy(default_items, vars_seen);
    if (NULL != newGen) {
        delete default_generator;
        default_generator = newGen;
    }
    
    vars_seen.erase(switch_var);
    
    return NULL;
}

GeneratorBase *GeneratorLeaf::update_policy(list<PolicyItem *> &reg_items, set<int> &vars_seen) {
    if (reg_items.empty())
        return NULL;
    
    bool all_done = true;
    for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); op_iter != reg_items.end(); ++op_iter) {
        if (!reg_item_done(*op_iter, vars_seen)) {
            all_done = false;
            break;
        }
    }
    
    if (all_done) {
        applicable_items.splice(applicable_items.end(), reg_items);
        return NULL;
    } else {
        reg_items.splice(reg_items.end(), applicable_items);
        return new GeneratorSwitch(reg_items, vars_seen);
    }
}

GeneratorBase *GeneratorEmpty::update_policy(list<PolicyItem *> &reg_items, set<int> &vars_seen) {
    if (reg_items.empty())
        return NULL;
    
    bool all_done = true;
    for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); op_iter != reg_items.end(); ++op_iter) {
        if (!reg_item_done(*op_iter, vars_seen)) {
            all_done = false;
            break;
        }
    }
    
    if (all_done)
        return new GeneratorLeaf(reg_items);
    else
        return new GeneratorSwitch(reg_items, vars_seen);
}

void Policy::add_item(PolicyItem *item) {
    list<PolicyItem *> reg_items;
    reg_items.push_back(item);
    update_policy(reg_items, (g_detect_deadends && g_generalize_deadends));
}


void Policy::update_policy(list<PolicyItem *> &reg_items, bool detect_deadends) {
    g_timer_policy_build.resume();

    // Reset the score since a change is being made to the policy
    score = 0.0;

    set<int> vars_seen;
    if (root)
        root->update_policy(reg_items, vars_seen);
    else
        /* TODO: Find out what's a GeneratorSwitch and what is it used for */
        root = new GeneratorSwitch(reg_items, vars_seen);
    /* Insert all items in reg_items into all_items starting at all_items's end poisiton */
    all_items.insert(all_items.end(), reg_items.begin(), reg_items.end());
    
    // As an optimization, we check the partial state successors of every
    //  new action for deadends. This allows us to stop expanding earlier
    //  with the scd algorithm below.
    /* TODO: adapt for Fault tolerant actions */
    if (detect_deadends) {
        vector<DeadendTuple *> new_deadends;
        for (list<PolicyItem *>::iterator op_iter = reg_items.begin(); op_iter != reg_items.end(); ++op_iter) {
            RegressionStep * rs = (RegressionStep *)(*op_iter);
            if (!(rs->is_goal)) {
                /* iterate for every effect (DETDUP) of the operation associated with the regression step rs */
                for (int i = 0; i < g_nondet_mapping[rs->op->nondet_index]->size(); i++) {
                    /* Progress from the state in the current reg_step, through the i-th effect of rs->op */
                    PartialState *succ_state = new PartialState(*(rs->state), *((*(g_nondet_mapping[rs->op->nondet_index]))[i]));
                    /* If the successor effect of this progression is a deadend, create a new deadend tuple and add it
                     * to the new-deadends vector*/
                    if (is_deadend(*succ_state)) {
                        generalize_deadend(*succ_state);
                        new_deadends.push_back(new DeadendTuple(succ_state, new PartialState(*(rs->state)), (*(g_nondet_mapping[rs->op->nondet_index]))[i]));
                    }
                }
            }
        }
        if (new_deadends.size() > 0)
            update_deadends(new_deadends);
    }
    
    g_timer_policy_build.stop();
}

void Policy::generate_applicable_items(const PartialState &curr, vector<PolicyItem *> &reg_items, bool keep_all) {
    if (root)
        root->generate_applicable_items(curr, reg_items, keep_all);
}

bool Policy::check_match(const PartialState &curr, bool keep_all) {
    if (root)
        return root->check_match(curr, keep_all);
    else
        return false;
}

RegressionStep *Policy::get_best_step(const PartialState &curr) {
    
    if (0 == root)
        return 0;
    
    g_timer_policy_use.resume();
    vector<PolicyItem *> current_steps;
    generate_applicable_items(curr, current_steps);
    
    if (0 == current_steps.size()) {
        g_timer_policy_use.stop();
        return 0;
    }
    
    // We should only return steps that aren't forbidden
    vector<PolicyItem *> forbidden_items;
    set<int> forbidden;
    if (!complete)
        g_deadend_policy->generate_applicable_items(curr, forbidden_items);
    for (int i = 0; i < forbidden_items.size(); i++)
        forbidden.insert(((NondetDeadend*)(forbidden_items[i]))->op_index);
    
    int best_index = -1;
    int best_val = 999999; // This will only be invalid if a plan length was > 10^6
    
    int best_sc_index = -1;
    int best_sc_val = 999999;
    
    for (int i = 0; i < current_steps.size(); i++) {
        if (((RegressionStep*)(current_steps[i]))->is_goal ||
            (0 == forbidden.count(((RegressionStep*)(current_steps[i]))->op->nondet_index))) {
            int cur_val = ((RegressionStep*)(current_steps[i]))->distance;
            
            if (cur_val < best_val) {
                best_val = cur_val;
                best_index = i;
            }
            
            if (g_optimized_scd &&
                ((RegressionStep*)(current_steps[i]))->is_sc &&
                (cur_val < best_sc_val)) {
                best_sc_val = cur_val;
                best_sc_index = i;
            }
        }
    }
    g_timer_policy_use.stop();
    
    if (-1 == best_index)
        return 0;
    else if (g_optimized_scd && (-1 != best_sc_index))
        return (RegressionStep*)(current_steps[best_sc_index]);
    else
        return (RegressionStep*)(current_steps[best_index]);
}

Policy::Policy() {
    root = 0;
    score = 0.0;
    complete = false;
}

Policy::~Policy() {
    if (root)
        delete root;
    
    for (list<PolicyItem *>::const_iterator op_iter = all_items.begin();
         op_iter != all_items.end(); ++op_iter)
         delete *op_iter;
}

void Policy::dump() const {
    cout << "Policy:" << endl;
    //root->dump("  ");
    for (list<PolicyItem *>::const_iterator op_iter = all_items.begin();
         op_iter != all_items.end(); ++op_iter)
         (*op_iter)->dump();
}
void Policy::generate_cpp_input(ofstream &outfile) const {
    root->generate_cpp_input(outfile);
}



double Policy::get_score() {
    if (0.0 == score)
        evaluate();
    return min(score, 1.0);
}

void Policy::evaluate() {
    if (1.0 <= score)
        return;
    
    g_timer_policy_eval.resume();
    
    //evaluate_analytical();
    evaluate_random();
    
    g_timer_policy_eval.stop();
}

void Policy::evaluate_analytical() {
    
}

void Policy::evaluate_random() {
    Simulator *sim = new Simulator(false);
    int succeeded = 0;
    int NUMTRIALS = 1000;
    for (int i = 0; i < NUMTRIALS; i++) {
        sim->run_once(true, this);
        if (sim->succeeded)
            succeeded++;
    }
    score = double(succeeded) / double(NUMTRIALS);
}






/***************************
 * Strong cyclic detection *
 ***************************/




bool Policy::goal_sc_reachable(const PartialState &_curr) {
    
    PartialState *curr = new PartialState(_curr);
    PartialState *old;
    RegressionStep *rstep;
    
    // Instead of keeping a closed list, we just try to get to the
    //  goal within an upper bound.
    for (int i=0; i < all_items.size(); i++) {
        
        rstep = get_best_step(*curr);
        
        if (!rstep || !(rstep->is_sc)) {
            delete curr;
            return false;
        }
        
        if (rstep->is_goal) {
            delete curr;
            return true;
        }
        
        old = curr;
        curr = new PartialState(*old, *(rstep->op));
        
        delete old;
    }
    
    return false;
}


void Policy::init_scd() {
    for (list<PolicyItem *>::const_iterator op_iter = all_items.begin();
         op_iter != all_items.end(); ++op_iter)
         ((RegressionStep *)(*op_iter))->is_sc = true;
}

bool Policy::step_scd(vector< DeadendTuple * > &failed_states, bool skip_deadends) {
    
    bool made_change = false;
    bool debug_scd = false;
    //bool debug_scd = !g_silent_planning;
    
    for (list<PolicyItem *>::const_iterator op_iter = all_items.begin();
         op_iter != all_items.end(); ++op_iter)
    {
        RegressionStep *rs = (RegressionStep *)(*op_iter);
        
        if (rs->is_sc && !(rs->is_goal)) {
            
            if (debug_scd) {
                cout << "\n\n (#" << g_debug_count++ << ") Testing RegStep:" << endl;
                rs->dump();
            }
            
            for (int i = 0; i < g_nondet_mapping[rs->op->nondet_index]->size(); i++) {
                // We use the sc_state for computing the guaranteed items, rather than
                //  the original state for the regression step. The sc_state will be a
                //  superset of the original state that includes the regression of newly
                //  closed leafs from the jic compilation phase. This may increase the
                //  number of regression steps we are guaranteed to see in a state matching
                //  succ_state, but as long as we remain in parts of the policy that return
                //  regression steps based on their sc_state then this will be valid.
                PartialState *succ_state = new PartialState(*(rs->state), *((*(g_nondet_mapping[rs->op->nondet_index]))[i]));
                vector<PolicyItem *> guaranteed_steps;
                root->generate_applicable_items(*succ_state, guaranteed_steps, false);
                
                if (debug_scd) {
                    cout << "\nTesting successor (" << (i+1) << "/" << g_nondet_mapping[rs->op->nondet_index]->size() << "):" << endl;
                    succ_state->dump_pddl();
                }
                
                
                // We need at least one guaranteed step to be sure that we can continue
                //  executing. The one exception is if the state is already known to be
                //  a deadend, in which case we can assume that it will be handled by
                //  the jic compiler.
                if (0 == guaranteed_steps.size()) {
                    bool is_failed_state = false;
                    for (int j = 0; j < failed_states.size(); j++) {
                        // Unfortunately, we can't just check the states equivalence,
                        //  since the succ_state is a partial state. So we instead check
                        //  that succ_state entails the failed state.
                        is_failed_state = true;
                        for (int k = 0; k < g_variable_name.size(); k++) {
                            if (((*(failed_states[j]->de_state))[k] != -1) &&
                                ((*(failed_states[j]->de_state))[k] != (*succ_state)[k])) {
                                is_failed_state = false;
                                break;
                            }
                        }
                        
                        if (debug_scd) {
                            cout << "-+- Left marked due to existing failed state." << endl;
                        }
                    }
                    
                    
                    
                    if (!is_failed_state) {
                        if (g_deadend_states->check_match(*succ_state, true)) {
                            is_failed_state = true;
                            if (debug_scd) {
                                cout << "-+- Left marked due to existing deadend state." << endl;
                            }
                        }
                    }
                    
                    // If succ_state is a failed state, then we will avoid using
                    //  this pair in the future as it will be a FSAP. Thus, we
                    //  can leave it marked so that the search doesn't continue
                    //  down this path -- leaving it marked here doesn't mean
                    //  that the policy is strong cyclic, but rather that no
                    //  strong cyclic plan exists and further search should be
                    //  avoided.
                    if (is_failed_state && skip_deadends) {
                        break;
                    }
                    
                    // If succ_state isn't a failed state (as far as we're aware
                    //  of), then it may be reached during rollout. The possibility
                    //  of not handling the reached state means that this can't be
                    //  strongly cyclic. The break take us to the next regression
                    //  step to check (i.e., no need to check the rest of the action
                    //  outcomes for the current regression step).
                    else {
                        if (debug_scd) {
                            cout << "--- Umarking: No guaranteed steps." << endl;
                        }
                        rs->is_sc = false;
                        made_change = true;
                        delete succ_state;
                        break;
                    }
                }
                
                // We only consider the possible steps that have a cheaper cost than
                //  the cheapest guaranteed cost. We will be returning the cheapest
                //  cost in a get_best_step, so only those regsteps with a chance of
                //  overiding all guaranteed regsteps must be looked at.
                int min_cost = 999999; // This will only be too low if we found a plan of length 10^6
                int min_sc_cost = 999999;
                for (int j = 0; j < guaranteed_steps.size(); j++) {
                    
                    if (((RegressionStep *)guaranteed_steps[j])->distance < min_cost)
                        min_cost = ((RegressionStep *)guaranteed_steps[j])->distance;
                        
                    if ((((RegressionStep *)guaranteed_steps[j])->distance < min_sc_cost) &&
                        ((RegressionStep *)guaranteed_steps[j])->is_sc)
                        min_sc_cost = ((RegressionStep *)guaranteed_steps[j])->distance;
                
                }
                
                // The guaranteed step can't be further from the goal than
                //  the current candidate strong cyclic pair. Otherwise,
                //  we could get an unsound loop of presumed strong cyclicity.
                if (debug_scd && (999999 == min_sc_cost)) {
                    cout << "--- Umarking: No strong cyclic guaranteed step." << endl;
                }
                
                if ((999999 == min_sc_cost) ||
                    ((min_sc_cost >= rs->distance) &&
                    !(goal_sc_reachable(*succ_state)))) {
                    
                    if (debug_scd && (999999 != min_sc_cost)) {
                        cout << "--- Unmarking: Strong cyclic guaranteed step failed to reach the goal." << endl;
                    }
                    //cout << "Min sc cost = " << min_sc_cost << endl;
                    rs->is_sc = false;
                    made_change = true;
                    i = g_nondet_mapping[rs->op->nondet_index]->size();
                    
                } else {
                    
                    if (debug_scd) {
                        cout << "+++ Left marked." << endl;
                    }
                }
                
                delete succ_state;
            }
        }
    }
    return made_change;
}

bool regstep_compare(PolicyItem* first, PolicyItem* second) {
    if (((RegressionStep*)first)->is_sc != ((RegressionStep*)second)->is_sc)
        return ((RegressionStep*)first)->is_sc;
    else
        return ((RegressionStep*)first)->distance < ((RegressionStep*)second)->distance;
}
void Policy::dump_human_policy() {
    
    all_items.sort(regstep_compare);
    
    fstream outfile;
    outfile.open("policy.out", ios::out);
        
    for (list<PolicyItem *>::const_iterator op_iter = all_items.begin();
         op_iter != all_items.end(); ++op_iter) {
        
        outfile << "\nIf holds:";
        PartialState *s = ((RegressionStep*)(*op_iter))->state;
        for (int i = 0; i < g_variable_domain.size(); i++) {
            if (-1 != (*s)[i]) {
                outfile << " ";
                outfile << g_variable_name[i] << ":" << (*s)[i];
            }
        }
        outfile << endl;
        outfile << "Execute: " << ((RegressionStep*)(*op_iter))->get_name() << endl;
    }
    
    outfile.close();
}

