(define (problem simple_blocks_problem)
  (:domain blocks-domain)
  (:objects b1 t1 b2 t2 b3 t3 - block_t)
  (:init (inhand b3) (on b1 t1) (clear b1) (on b2 t2) (clear b2) (clear t3))
  (:goal (and (on b1 b2) (on b2 t2)))
)