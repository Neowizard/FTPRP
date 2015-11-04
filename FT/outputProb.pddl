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
	level_2_1 - levelType
	level_3_1 - levelType
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
	(not-in-pick-up)
	(not-in-pick-up-from-table)
	(not-in-put-on-block)
	(not-in-pick-tower)
	(not-in-put-tower-on-block)
	(closed level_1_1)
	(closed level_2_1)
	(closed level_3_1)
	(next-level-of-pick-up level_0_0 level_0_1)
	(next-level-of-pick-up-from-table level_0_0 level_0_1)
	(next-level-of-put-on-block level_0_0 level_0_1)
	(next-level-of-pick-tower level_0_0 level_0_1)
	(next-level-of-put-tower-on-block level_0_0 level_0_1)
	(next-level-of-pick-up level_1_1 level_1_1)
	(next-level-of-pick-up-from-table level_1_1 level_1_1)
	(next-level-of-put-on-block level_1_1 level_1_1)
	(next-level-of-pick-tower level_1_1 level_1_1)
	(next-level-of-put-tower-on-block level_1_1 level_1_1)
	(next-level-of-pick-up level_2_1 level_2_1)
	(next-level-of-pick-up-from-table level_2_1 level_2_1)
	(next-level-of-put-on-block level_2_1 level_2_1)
	(next-level-of-pick-tower level_2_1 level_2_1)
	(next-level-of-put-tower-on-block level_2_1 level_2_1)
	(next-level-of-pick-up level_3_1 level_3_1)
	(next-level-of-pick-up-from-table level_3_1 level_3_1)
	(next-level-of-put-on-block level_3_1 level_3_1)
	(next-level-of-pick-tower level_3_1 level_3_1)
	(next-level-of-put-tower-on-block level_3_1 level_3_1)
)

(:goal
	(closed level_0_0)
)
)