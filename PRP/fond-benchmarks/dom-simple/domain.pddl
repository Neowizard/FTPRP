(define (problem prob_simple)
  (:domain dom_simple)
  (:objects b1 - block)
  (:init ()) ; Nothing is true initially.
  (:goal (inhand b1)) ; Goal is reached when b1 is in my hand.
  )
