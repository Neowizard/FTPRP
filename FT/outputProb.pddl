(define (problem bw_5_2)
(:domain blocks-domain)

(:objects 
	b1 - block
	b2 - block
	b3 - block
	b4 - block
	b5 - block
	level_0_0 - levelType
	level_1_1 - levelType
)

(:init
	(emptyhand level_0_0)
	(on-table b1 level_0_0)
	(on-table b2 level_0_0)
	(on-table b3 level_0_0)
	(on b4 b2 level_0_0)
	(on b5 b1 level_0_0)
	(clear b3 level_0_0)
	(clear b4 level_0_0)
	(clear b5 level_0_0)
	(closed level_1_1)
)

(:goal
	(closed level_0_0)
)
)