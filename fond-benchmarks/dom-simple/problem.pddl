(define (domain dom_simple)
  (:requirements :equality :negative-preconditions :typing)
  (:types block)
  
  (:predicates
   (inhand ?b - block) ; Predicate describing parameter ?b of type block
   )
  
  (:action pickup
           :parameters (?b1 - block)
           :precondition ()) 
           :effect
           (oneof ; Either of the folloing effects can occur
            (and (inhand ?b1)) ; Picked up block. N ?b1 is in my hand.
            (and)) ; Failed to pick block up, nothing happened.
)
