(define (problem simple_blocks_problem)
(:domain blocks-domain)

(:objects 
	b1 - block_t
	b2 - block_t
	t1 - block_t
	t2 - block_t
	d1 - dummyType
	level_0_0 - levelType
	level_1_0 - levelType
	level_1_1 - levelType
)

(:init
	(inhand b1 level_0_0)
	(clear t1 level_0_0)
	(on b2 t2 level_0_0)
	(clear b2 level_0_0)
	(closed level_1_0)
	(closed level_1_1)
)

(:goal
	(closed level_0_0)
)
)