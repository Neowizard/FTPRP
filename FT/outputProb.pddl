(define (problem simple_blocks_problem)
(:domain blocks-domain)

(:objects 
	b1 - block_t
	t1 - block_t
	level_0_0 - levelType
	level_1_1 - levelType
)

(:init
	(not_emptyhand level_0_0)
	(inhand b1 level_0_0)
	(clear t1 level_0_0)
	(closed level_1_1)
)

(:goal
	(closed level_0_0)
)
)