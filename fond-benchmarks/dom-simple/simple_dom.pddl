(define (domain dom_simple)
  (:requirements :non-deterministic :typing) ; Definition for the requirements of domain we're defining. It may contain non-det actions and should support typing. 
  (:types block)
  
  (:predicates
   (inhand ?b - block) ; Predicate describing parameter ?b of type block
   )
  
  (:action pickup
           :parameters (?b1 - block)
           :precondition ()) 
           :effect
           (oneof ; Either of the folloing effects can occur. Non-deterministic action
            (and (inhand ?b1)) ; Picked up block. N ?b1 is in my hand.
            (and)) ; Failed to pick block up, nothing happened.
)
