(define (domain blocks-domain)
(:requirements :equality :negative-preconditions :typing)
	(:types block levelType)
	(:predicates
		(holding ?b - block ?level - levelType)
		(emptyhand ?level - levelType)
		(on-table ?b - block ?level - levelType)
		(on ?b1 - block ?b2 - block ?level - levelType)
		(clear ?b - block ?level - levelType)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(closed ?level - levelType)
		(next-level-of-pick-up ?level1 - levelType ?level2 - levelType)
		(copied-pos-pick-up ?level - levelType)
		(copied-neg-pick-up ?level - levelType)
		(next-level-of-pick-up-from-table ?level1 - levelType ?level2 - levelType)
		(copied-pos-pick-up-from-table ?level - levelType)
		(copied-neg-pick-up-from-table ?level - levelType)
		(next-level-of-put-on-block ?level1 - levelType ?level2 - levelType)
		(copied-pos-put-on-block ?level - levelType)
		(copied-neg-put-on-block ?level - levelType)
		(next-level-of-pick-tower ?level1 - levelType ?level2 - levelType)
		(copied-pos-pick-tower ?level - levelType)
		(copied-neg-pick-tower ?level - levelType)
		(next-level-of-put-tower-on-block ?level1 - levelType ?level2 - levelType)
		(copied-pos-put-tower-on-block ?level - levelType)
		(copied-neg-put-tower-on-block ?level - levelType)
	)

	(:action pick-up_0_0_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_0_0)
		(copied-neg-pick-up level_0_0)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(not (= ?b1 ?b2))
		(emptyhand level_0_0)
		(clear ?b1 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		(and
		(and (holding ?b1 level_0_0) (clear ?b2 level_0_0) (not (emptyhand level_0_0)) (not (clear ?b1 level_0_0)) (not (on ?b1 ?b2 level_0_0)) )
		(and (not (closed level_1_1)) (clear ?b2 level_1_1) (on-table ?b1 level_1_1) (not (on ?b1 ?b2 level_1_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_0_0)) 
		(not (copied-neg-pick-up level_0_0)) 
		)
	)

	(:action pick-up_0_0_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_0_0)
		(copied-neg-pick-up level_0_0)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(not (= ?b1 ?b2))
		(emptyhand level_0_0)
		(clear ?b1 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		(and
		(and (not (closed level_1_0)) (holding ?b1 level_1_0) (clear ?b2 level_1_0) (not (emptyhand level_1_0)) (not (clear ?b1 level_1_0)) (not (on ?b1 ?b2 level_1_0)) )
		(and (clear ?b2 level_0_0) (on-table ?b1 level_0_0) (not (on ?b1 ?b2 level_0_0)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_0_0)) 
		(not (copied-neg-pick-up level_0_0)) 
		)
	)

	(:action pick-up_1_1_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_1_1)
		(copied-neg-pick-up level_1_1)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(not (= ?b1 ?b2))
		(emptyhand level_1_1)
		(clear ?b1 level_1_1)
		(on ?b1 ?b2 level_1_1)
		)
	:effect 
		(and
		(and (holding ?b1 level_1_1) (clear ?b2 level_1_1) (not (emptyhand level_1_1)) (not (clear ?b1 level_1_1)) (not (on ?b1 ?b2 level_1_1)) )
		(and (not (closed level_2_1)) (clear ?b2 level_2_1) (on-table ?b1 level_2_1) (not (on ?b1 ?b2 level_2_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_1_1)) 
		(not (copied-neg-pick-up level_1_1)) 
		)
	)

	(:action pick-up_1_1_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_1_1)
		(copied-neg-pick-up level_1_1)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(not (= ?b1 ?b2))
		(emptyhand level_1_1)
		(clear ?b1 level_1_1)
		(on ?b1 ?b2 level_1_1)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (holding ?b1 level_2_0) (clear ?b2 level_2_0) (not (emptyhand level_2_0)) (not (clear ?b1 level_2_0)) (not (on ?b1 ?b2 level_2_0)) )
		(and (clear ?b2 level_1_1) (on-table ?b1 level_1_1) (not (on ?b1 ?b2 level_1_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_1_1)) 
		(not (copied-neg-pick-up level_1_1)) 
		)
	)

	(:action pick-up_2_1_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_2_1)
		(copied-neg-pick-up level_2_1)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(not (= ?b1 ?b2))
		(emptyhand level_2_1)
		(clear ?b1 level_2_1)
		(on ?b1 ?b2 level_2_1)
		)
	:effect 
		(and
		(and (holding ?b1 level_2_1) (clear ?b2 level_2_1) (not (emptyhand level_2_1)) (not (clear ?b1 level_2_1)) (not (on ?b1 ?b2 level_2_1)) )
		(and (not (closed level_3_1)) (clear ?b2 level_3_1) (on-table ?b1 level_3_1) (not (on ?b1 ?b2 level_3_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_2_1)) 
		(not (copied-neg-pick-up level_2_1)) 
		)
	)

	(:action pick-up_2_1_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_2_1)
		(copied-neg-pick-up level_2_1)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(not (= ?b1 ?b2))
		(emptyhand level_2_1)
		(clear ?b1 level_2_1)
		(on ?b1 ?b2 level_2_1)
		)
	:effect 
		(and
		(and (not (closed level_3_0)) (holding ?b1 level_3_0) (clear ?b2 level_3_0) (not (emptyhand level_3_0)) (not (clear ?b1 level_3_0)) (not (on ?b1 ?b2 level_3_0)) )
		(and (clear ?b2 level_2_1) (on-table ?b1 level_2_1) (not (on ?b1 ?b2 level_2_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_2_1)) 
		(not (copied-neg-pick-up level_2_1)) 
		)
	)

	(:action pick-up_3_1_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_3_1)
		(copied-neg-pick-up level_3_1)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(not (= ?b1 ?b2))
		(emptyhand level_3_1)
		(clear ?b1 level_3_1)
		(on ?b1 ?b2 level_3_1)
		)
	:effect 
		(and
		(and (holding ?b1 level_3_1) (clear ?b2 level_3_1) (not (emptyhand level_3_1)) (not (clear ?b1 level_3_1)) (not (on ?b1 ?b2 level_3_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_3_1)) 
		(not (copied-neg-pick-up level_3_1)) 
		)
	)

	(:action pick-up_3_1_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-pick-up))
		(copied-pos-pick-up level_3_1)
		(copied-neg-pick-up level_3_1)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(not (= ?b1 ?b2))
		(emptyhand level_3_1)
		(clear ?b1 level_3_1)
		(on ?b1 ?b2 level_3_1)
		)
	:effect 
		(and
		(and (clear ?b2 level_3_1) (on-table ?b1 level_3_1) (not (on ?b1 ?b2 level_3_1)) )
		(not-in-pick-up) 
		(not (copied-pos-pick-up level_3_1)) 
		(not (copied-neg-pick-up level_3_1)) 
		)
	)

	(:action pick-up-from-table_0_0_e0
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_0_0)
		(copied-neg-pick-up-from-table level_0_0)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_0_0)
		(clear ?b level_0_0)
		(on-table ?b level_0_0)
		)
	:effect 
		(and
		(and (not (closed level_1_1)) (holding ?b level_1_1) (not (emptyhand level_1_1)) (not (on-table ?b level_1_1)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_0_0)) 
		(not (copied-neg-pick-up-from-table level_0_0)) 
		)
	)

	(:action pick-up-from-table_0_0_e1
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_0_0)
		(copied-neg-pick-up-from-table level_0_0)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_0_0)
		(clear ?b level_0_0)
		(on-table ?b level_0_0)
		)
	:effect 
		(and
		(not (closed level_1_0)) 
		(and (holding ?b level_0_0) (not (emptyhand level_0_0)) (not (on-table ?b level_0_0)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_0_0)) 
		(not (copied-neg-pick-up-from-table level_0_0)) 
		)
	)

	(:action pick-up-from-table_1_1_e0
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_1_1)
		(copied-neg-pick-up-from-table level_1_1)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_1_1)
		(clear ?b level_1_1)
		(on-table ?b level_1_1)
		)
	:effect 
		(and
		(and (not (closed level_2_1)) (holding ?b level_2_1) (not (emptyhand level_2_1)) (not (on-table ?b level_2_1)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_1_1)) 
		(not (copied-neg-pick-up-from-table level_1_1)) 
		)
	)

	(:action pick-up-from-table_1_1_e1
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_1_1)
		(copied-neg-pick-up-from-table level_1_1)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_1_1)
		(clear ?b level_1_1)
		(on-table ?b level_1_1)
		)
	:effect 
		(and
		(not (closed level_2_0)) 
		(and (holding ?b level_1_1) (not (emptyhand level_1_1)) (not (on-table ?b level_1_1)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_1_1)) 
		(not (copied-neg-pick-up-from-table level_1_1)) 
		)
	)

	(:action pick-up-from-table_2_1_e0
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_2_1)
		(copied-neg-pick-up-from-table level_2_1)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(emptyhand level_2_1)
		(clear ?b level_2_1)
		(on-table ?b level_2_1)
		)
	:effect 
		(and
		(and (not (closed level_3_1)) (holding ?b level_3_1) (not (emptyhand level_3_1)) (not (on-table ?b level_3_1)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_2_1)) 
		(not (copied-neg-pick-up-from-table level_2_1)) 
		)
	)

	(:action pick-up-from-table_2_1_e1
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_2_1)
		(copied-neg-pick-up-from-table level_2_1)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(emptyhand level_2_1)
		(clear ?b level_2_1)
		(on-table ?b level_2_1)
		)
	:effect 
		(and
		(not (closed level_3_0)) 
		(and (holding ?b level_2_1) (not (emptyhand level_2_1)) (not (on-table ?b level_2_1)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_2_1)) 
		(not (copied-neg-pick-up-from-table level_2_1)) 
		)
	)

	(:action pick-up-from-table_3_1_e0
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_3_1)
		(copied-neg-pick-up-from-table level_3_1)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(emptyhand level_3_1)
		(clear ?b level_3_1)
		(on-table ?b level_3_1)
		)
	:effect 
		(and
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_3_1)) 
		(not (copied-neg-pick-up-from-table level_3_1)) 
		)
	)

	(:action pick-up-from-table_3_1_e1
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (not-in-pick-up-from-table))
		(copied-pos-pick-up-from-table level_3_1)
		(copied-neg-pick-up-from-table level_3_1)
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(emptyhand level_3_1)
		(clear ?b level_3_1)
		(on-table ?b level_3_1)
		)
	:effect 
		(and
		(and (holding ?b level_3_1) (not (emptyhand level_3_1)) (not (on-table ?b level_3_1)) )
		(not-in-pick-up-from-table) 
		(not (copied-pos-pick-up-from-table level_3_1)) 
		(not (copied-neg-pick-up-from-table level_3_1)) 
		)
	)

	(:action put-on-block_0_0_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_0_0)
		(copied-neg-put-on-block level_0_0)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b1 level_0_0)
		(clear ?b2 level_0_0)
		)
	:effect 
		(and
		(and (on ?b1 ?b2 level_0_0) (emptyhand level_0_0) (clear ?b1 level_0_0) (not (holding ?b1 level_0_0)) (not (clear ?b2 level_0_0)) )
		(and (not (closed level_1_1)) (on-table ?b1 level_1_1) (emptyhand level_1_1) (clear ?b1 level_1_1) (not (holding ?b1 level_1_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_0_0)) 
		(not (copied-neg-put-on-block level_0_0)) 
		)
	)

	(:action put-on-block_0_0_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_0_0)
		(copied-neg-put-on-block level_0_0)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b1 level_0_0)
		(clear ?b2 level_0_0)
		)
	:effect 
		(and
		(and (not (closed level_1_0)) (on ?b1 ?b2 level_1_0) (emptyhand level_1_0) (clear ?b1 level_1_0) (not (holding ?b1 level_1_0)) (not (clear ?b2 level_1_0)) )
		(and (on-table ?b1 level_0_0) (emptyhand level_0_0) (clear ?b1 level_0_0) (not (holding ?b1 level_0_0)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_0_0)) 
		(not (copied-neg-put-on-block level_0_0)) 
		)
	)

	(:action put-on-block_1_1_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_1_1)
		(copied-neg-put-on-block level_1_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b1 level_1_1)
		(clear ?b2 level_1_1)
		)
	:effect 
		(and
		(and (on ?b1 ?b2 level_1_1) (emptyhand level_1_1) (clear ?b1 level_1_1) (not (holding ?b1 level_1_1)) (not (clear ?b2 level_1_1)) )
		(and (not (closed level_2_1)) (on-table ?b1 level_2_1) (emptyhand level_2_1) (clear ?b1 level_2_1) (not (holding ?b1 level_2_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_1_1)) 
		(not (copied-neg-put-on-block level_1_1)) 
		)
	)

	(:action put-on-block_1_1_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_1_1)
		(copied-neg-put-on-block level_1_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b1 level_1_1)
		(clear ?b2 level_1_1)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (on ?b1 ?b2 level_2_0) (emptyhand level_2_0) (clear ?b1 level_2_0) (not (holding ?b1 level_2_0)) (not (clear ?b2 level_2_0)) )
		(and (on-table ?b1 level_1_1) (emptyhand level_1_1) (clear ?b1 level_1_1) (not (holding ?b1 level_1_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_1_1)) 
		(not (copied-neg-put-on-block level_1_1)) 
		)
	)

	(:action put-on-block_2_1_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_2_1)
		(copied-neg-put-on-block level_2_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(holding ?b1 level_2_1)
		(clear ?b2 level_2_1)
		)
	:effect 
		(and
		(and (on ?b1 ?b2 level_2_1) (emptyhand level_2_1) (clear ?b1 level_2_1) (not (holding ?b1 level_2_1)) (not (clear ?b2 level_2_1)) )
		(and (not (closed level_3_1)) (on-table ?b1 level_3_1) (emptyhand level_3_1) (clear ?b1 level_3_1) (not (holding ?b1 level_3_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_2_1)) 
		(not (copied-neg-put-on-block level_2_1)) 
		)
	)

	(:action put-on-block_2_1_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_2_1)
		(copied-neg-put-on-block level_2_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(holding ?b1 level_2_1)
		(clear ?b2 level_2_1)
		)
	:effect 
		(and
		(and (not (closed level_3_0)) (on ?b1 ?b2 level_3_0) (emptyhand level_3_0) (clear ?b1 level_3_0) (not (holding ?b1 level_3_0)) (not (clear ?b2 level_3_0)) )
		(and (on-table ?b1 level_2_1) (emptyhand level_2_1) (clear ?b1 level_2_1) (not (holding ?b1 level_2_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_2_1)) 
		(not (copied-neg-put-on-block level_2_1)) 
		)
	)

	(:action put-on-block_3_1_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_3_1)
		(copied-neg-put-on-block level_3_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(holding ?b1 level_3_1)
		(clear ?b2 level_3_1)
		)
	:effect 
		(and
		(and (on ?b1 ?b2 level_3_1) (emptyhand level_3_1) (clear ?b1 level_3_1) (not (holding ?b1 level_3_1)) (not (clear ?b2 level_3_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_3_1)) 
		(not (copied-neg-put-on-block level_3_1)) 
		)
	)

	(:action put-on-block_3_1_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (not-in-put-on-block))
		(copied-pos-put-on-block level_3_1)
		(copied-neg-put-on-block level_3_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(holding ?b1 level_3_1)
		(clear ?b2 level_3_1)
		)
	:effect 
		(and
		(and (on-table ?b1 level_3_1) (emptyhand level_3_1) (clear ?b1 level_3_1) (not (holding ?b1 level_3_1)) )
		(not-in-put-on-block) 
		(not (copied-pos-put-on-block level_3_1)) 
		(not (copied-neg-put-on-block level_3_1)) 
		)
	)

	(:action put-down_0_0_
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b level_0_0)
		)
	:effect 
		 
		(and (on-table ?b level_0_0) (emptyhand level_0_0) (clear ?b level_0_0) (not (holding ?b level_0_0)) )
 
	)

	(:action put-down_0_0_
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b level_0_0)
		)
	:effect 
		 
		(and (on-table ?b level_0_0) (emptyhand level_0_0) (clear ?b level_0_0) (not (holding ?b level_0_0)) )
 
	)

	(:action put-down_0_0_
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b level_0_0)
		)
	:effect 
		 
		(and (on-table ?b level_0_0) (emptyhand level_0_0) (clear ?b level_0_0) (not (holding ?b level_0_0)) )
 
	)

	(:action put-down_0_0_
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b level_0_0)
		)
	:effect 
		 
		(and (on-table ?b level_0_0) (emptyhand level_0_0) (clear ?b level_0_0) (not (holding ?b level_0_0)) )
 
	)

	(:action pick-tower_0_0_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_0_0)
		(copied-neg-pick-tower level_0_0)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_0_0)
		(on ?b1 ?b2 level_0_0)
		(on ?b2 ?b3 level_0_0)
		)
	:effect 
		(and
		(and (not (closed level_1_1)) (holding ?b2 level_1_1) (clear ?b3 level_1_1) (not (emptyhand level_1_1)) (not (on ?b2 ?b3 level_1_1)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_0_0)) 
		(not (copied-neg-pick-tower level_0_0)) 
		)
	)

	(:action pick-tower_0_0_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_0_0)
		(copied-neg-pick-tower level_0_0)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_0_0)
		(on ?b1 ?b2 level_0_0)
		(on ?b2 ?b3 level_0_0)
		)
	:effect 
		(and
		(not (closed level_1_0)) 
		(and (holding ?b2 level_0_0) (clear ?b3 level_0_0) (not (emptyhand level_0_0)) (not (on ?b2 ?b3 level_0_0)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_0_0)) 
		(not (copied-neg-pick-tower level_0_0)) 
		)
	)

	(:action pick-tower_1_1_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_1_1)
		(copied-neg-pick-tower level_1_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_1_1)
		(on ?b1 ?b2 level_1_1)
		(on ?b2 ?b3 level_1_1)
		)
	:effect 
		(and
		(and (not (closed level_2_1)) (holding ?b2 level_2_1) (clear ?b3 level_2_1) (not (emptyhand level_2_1)) (not (on ?b2 ?b3 level_2_1)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_1_1)) 
		(not (copied-neg-pick-tower level_1_1)) 
		)
	)

	(:action pick-tower_1_1_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_1_1)
		(copied-neg-pick-tower level_1_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_1_1)
		(on ?b1 ?b2 level_1_1)
		(on ?b2 ?b3 level_1_1)
		)
	:effect 
		(and
		(not (closed level_2_0)) 
		(and (holding ?b2 level_1_1) (clear ?b3 level_1_1) (not (emptyhand level_1_1)) (not (on ?b2 ?b3 level_1_1)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_1_1)) 
		(not (copied-neg-pick-tower level_1_1)) 
		)
	)

	(:action pick-tower_2_1_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_2_1)
		(copied-neg-pick-tower level_2_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(emptyhand level_2_1)
		(on ?b1 ?b2 level_2_1)
		(on ?b2 ?b3 level_2_1)
		)
	:effect 
		(and
		(and (not (closed level_3_1)) (holding ?b2 level_3_1) (clear ?b3 level_3_1) (not (emptyhand level_3_1)) (not (on ?b2 ?b3 level_3_1)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_2_1)) 
		(not (copied-neg-pick-tower level_2_1)) 
		)
	)

	(:action pick-tower_2_1_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_2_1)
		(copied-neg-pick-tower level_2_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(emptyhand level_2_1)
		(on ?b1 ?b2 level_2_1)
		(on ?b2 ?b3 level_2_1)
		)
	:effect 
		(and
		(not (closed level_3_0)) 
		(and (holding ?b2 level_2_1) (clear ?b3 level_2_1) (not (emptyhand level_2_1)) (not (on ?b2 ?b3 level_2_1)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_2_1)) 
		(not (copied-neg-pick-tower level_2_1)) 
		)
	)

	(:action pick-tower_3_1_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_3_1)
		(copied-neg-pick-tower level_3_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(emptyhand level_3_1)
		(on ?b1 ?b2 level_3_1)
		(on ?b2 ?b3 level_3_1)
		)
	:effect 
		(and
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_3_1)) 
		(not (copied-neg-pick-tower level_3_1)) 
		)
	)

	(:action pick-tower_3_1_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-pick-tower))
		(copied-pos-pick-tower level_3_1)
		(copied-neg-pick-tower level_3_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(emptyhand level_3_1)
		(on ?b1 ?b2 level_3_1)
		(on ?b2 ?b3 level_3_1)
		)
	:effect 
		(and
		(and (holding ?b2 level_3_1) (clear ?b3 level_3_1) (not (emptyhand level_3_1)) (not (on ?b2 ?b3 level_3_1)) )
		(not-in-pick-tower) 
		(not (copied-pos-pick-tower level_3_1)) 
		(not (copied-neg-pick-tower level_3_1)) 
		)
	)

	(:action put-tower-on-block_0_0_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_0_0)
		(copied-neg-put-tower-on-block level_0_0)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		(clear ?b3 level_0_0)
		)
	:effect 
		(and
		(and (on ?b2 ?b3 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) (not (clear ?b3 level_0_0)) )
		(and (not (closed level_1_1)) (on-table ?b2 level_1_1) (emptyhand level_1_1) (not (holding ?b2 level_1_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_0_0)) 
		(not (copied-neg-put-tower-on-block level_0_0)) 
		)
	)

	(:action put-tower-on-block_0_0_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_0_0)
		(copied-neg-put-tower-on-block level_0_0)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		(clear ?b3 level_0_0)
		)
	:effect 
		(and
		(and (not (closed level_1_0)) (on ?b2 ?b3 level_1_0) (emptyhand level_1_0) (not (holding ?b2 level_1_0)) (not (clear ?b3 level_1_0)) )
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_0_0)) 
		(not (copied-neg-put-tower-on-block level_0_0)) 
		)
	)

	(:action put-tower-on-block_1_1_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_1_1)
		(copied-neg-put-tower-on-block level_1_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_1_1)
		(on ?b1 ?b2 level_1_1)
		(clear ?b3 level_1_1)
		)
	:effect 
		(and
		(and (on ?b2 ?b3 level_1_1) (emptyhand level_1_1) (not (holding ?b2 level_1_1)) (not (clear ?b3 level_1_1)) )
		(and (not (closed level_2_1)) (on-table ?b2 level_2_1) (emptyhand level_2_1) (not (holding ?b2 level_2_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_1_1)) 
		(not (copied-neg-put-tower-on-block level_1_1)) 
		)
	)

	(:action put-tower-on-block_1_1_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_1_1)
		(copied-neg-put-tower-on-block level_1_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_1_1)
		(on ?b1 ?b2 level_1_1)
		(clear ?b3 level_1_1)
		)
	:effect 
		(and
		(and (not (closed level_2_0)) (on ?b2 ?b3 level_2_0) (emptyhand level_2_0) (not (holding ?b2 level_2_0)) (not (clear ?b3 level_2_0)) )
		(and (on-table ?b2 level_1_1) (emptyhand level_1_1) (not (holding ?b2 level_1_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_1_1)) 
		(not (copied-neg-put-tower-on-block level_1_1)) 
		)
	)

	(:action put-tower-on-block_2_1_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_2_1)
		(copied-neg-put-tower-on-block level_2_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_2_1))
		(closed level_3_1)
		(holding ?b2 level_2_1)
		(on ?b1 ?b2 level_2_1)
		(clear ?b3 level_2_1)
		)
	:effect 
		(and
		(and (on ?b2 ?b3 level_2_1) (emptyhand level_2_1) (not (holding ?b2 level_2_1)) (not (clear ?b3 level_2_1)) )
		(and (not (closed level_3_1)) (on-table ?b2 level_3_1) (emptyhand level_3_1) (not (holding ?b2 level_3_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_2_1)) 
		(not (copied-neg-put-tower-on-block level_2_1)) 
		)
	)

	(:action put-tower-on-block_2_1_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_2_1)
		(copied-neg-put-tower-on-block level_2_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_2_1))
		(closed level_3_1)
		(holding ?b2 level_2_1)
		(on ?b1 ?b2 level_2_1)
		(clear ?b3 level_2_1)
		)
	:effect 
		(and
		(and (not (closed level_3_0)) (on ?b2 ?b3 level_3_0) (emptyhand level_3_0) (not (holding ?b2 level_3_0)) (not (clear ?b3 level_3_0)) )
		(and (on-table ?b2 level_2_1) (emptyhand level_2_1) (not (holding ?b2 level_2_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_2_1)) 
		(not (copied-neg-put-tower-on-block level_2_1)) 
		)
	)

	(:action put-tower-on-block_3_1_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_3_1)
		(copied-neg-put-tower-on-block level_3_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_3_1))
		(holding ?b2 level_3_1)
		(on ?b1 ?b2 level_3_1)
		(clear ?b3 level_3_1)
		)
	:effect 
		(and
		(and (on ?b2 ?b3 level_3_1) (emptyhand level_3_1) (not (holding ?b2 level_3_1)) (not (clear ?b3 level_3_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_3_1)) 
		(not (copied-neg-put-tower-on-block level_3_1)) 
		)
	)

	(:action put-tower-on-block_3_1_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (not-in-put-tower-on-block))
		(copied-pos-put-tower-on-block level_3_1)
		(copied-neg-put-tower-on-block level_3_1)
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (closed level_3_1))
		(holding ?b2 level_3_1)
		(on ?b1 ?b2 level_3_1)
		(clear ?b3 level_3_1)
		)
	:effect 
		(and
		(and (on-table ?b2 level_3_1) (emptyhand level_3_1) (not (holding ?b2 level_3_1)) )
		(not-in-put-tower-on-block) 
		(not (copied-pos-put-tower-on-block level_3_1)) 
		(not (copied-neg-put-tower-on-block level_3_1)) 
		)
	)

	(:action put-tower-down_0_0_
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		 
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
 
	)

	(:action put-tower-down_0_0_
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		 
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
 
	)

	(:action put-tower-down_0_0_
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		 
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
 
	)

	(:action put-tower-down_0_0_
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		 
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
 
	)

	(:action copy_substate_pos_pick-up
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not-in-pick-up)
		(not (closed ?level))
		(not (copied-pos-pick-up ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (holding ?b ?level) (next-level-of-pick-up ?level ?nlevel) ) (holding ?b ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (emptyhand ?level) (next-level-of-pick-up ?level ?nlevel) ) (emptyhand ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (on-table ?b ?level) (next-level-of-pick-up ?level ?nlevel) ) (on-table ?b ?nlevel) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (on ?b1 ?b2 ?level) (next-level-of-pick-up ?level ?nlevel) ) (on ?b1 ?b2 ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (clear ?b ?level) (next-level-of-pick-up ?level ?nlevel) ) (clear ?b ?nlevel) ))
		(copied-pos-pick-up ?level) 
		(not (not-in-pick-up)) 
		)
	)

	(:action copy_substate_neg_pick-up
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (not-in-pick-up))
		(not (closed ?level))
		(copied-pos-pick-up ?level)
		(not (copied-neg-pick-up ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (holding ?b ?level)) (next-level-of-pick-up ?level ?nlevel) ) (not (holding ?b ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (emptyhand ?level)) (next-level-of-pick-up ?level ?nlevel) ) (not (emptyhand ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (on-table ?b ?level)) (next-level-of-pick-up ?level ?nlevel) ) (not (on-table ?b ?nlevel)) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (not (on ?b1 ?b2 ?level)) (next-level-of-pick-up ?level ?nlevel) ) (not (on ?b1 ?b2 ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (clear ?b ?level)) (next-level-of-pick-up ?level ?nlevel) ) (not (clear ?b ?nlevel)) ))
		(copied-neg-pick-up ?level) 
		)
	)

	(:action copy_substate_pos_pick-up-from-table
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not-in-pick-up-from-table)
		(not (closed ?level))
		(not (copied-pos-pick-up-from-table ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (holding ?b ?level) (next-level-of-pick-up-from-table ?level ?nlevel) ) (holding ?b ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (emptyhand ?level) (next-level-of-pick-up-from-table ?level ?nlevel) ) (emptyhand ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (on-table ?b ?level) (next-level-of-pick-up-from-table ?level ?nlevel) ) (on-table ?b ?nlevel) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (on ?b1 ?b2 ?level) (next-level-of-pick-up-from-table ?level ?nlevel) ) (on ?b1 ?b2 ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (clear ?b ?level) (next-level-of-pick-up-from-table ?level ?nlevel) ) (clear ?b ?nlevel) ))
		(copied-pos-pick-up-from-table ?level) 
		(not (not-in-pick-up-from-table)) 
		)
	)

	(:action copy_substate_neg_pick-up-from-table
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (not-in-pick-up-from-table))
		(not (closed ?level))
		(copied-pos-pick-up-from-table ?level)
		(not (copied-neg-pick-up-from-table ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (holding ?b ?level)) (next-level-of-pick-up-from-table ?level ?nlevel) ) (not (holding ?b ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (emptyhand ?level)) (next-level-of-pick-up-from-table ?level ?nlevel) ) (not (emptyhand ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (on-table ?b ?level)) (next-level-of-pick-up-from-table ?level ?nlevel) ) (not (on-table ?b ?nlevel)) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (not (on ?b1 ?b2 ?level)) (next-level-of-pick-up-from-table ?level ?nlevel) ) (not (on ?b1 ?b2 ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (clear ?b ?level)) (next-level-of-pick-up-from-table ?level ?nlevel) ) (not (clear ?b ?nlevel)) ))
		(copied-neg-pick-up-from-table ?level) 
		)
	)

	(:action copy_substate_pos_put-on-block
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not-in-put-on-block)
		(not (closed ?level))
		(not (copied-pos-put-on-block ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (holding ?b ?level) (next-level-of-put-on-block ?level ?nlevel) ) (holding ?b ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (emptyhand ?level) (next-level-of-put-on-block ?level ?nlevel) ) (emptyhand ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (on-table ?b ?level) (next-level-of-put-on-block ?level ?nlevel) ) (on-table ?b ?nlevel) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (on ?b1 ?b2 ?level) (next-level-of-put-on-block ?level ?nlevel) ) (on ?b1 ?b2 ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (clear ?b ?level) (next-level-of-put-on-block ?level ?nlevel) ) (clear ?b ?nlevel) ))
		(copied-pos-put-on-block ?level) 
		(not (not-in-put-on-block)) 
		)
	)

	(:action copy_substate_neg_put-on-block
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (not-in-put-on-block))
		(not (closed ?level))
		(copied-pos-put-on-block ?level)
		(not (copied-neg-put-on-block ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (holding ?b ?level)) (next-level-of-put-on-block ?level ?nlevel) ) (not (holding ?b ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (emptyhand ?level)) (next-level-of-put-on-block ?level ?nlevel) ) (not (emptyhand ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (on-table ?b ?level)) (next-level-of-put-on-block ?level ?nlevel) ) (not (on-table ?b ?nlevel)) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (not (on ?b1 ?b2 ?level)) (next-level-of-put-on-block ?level ?nlevel) ) (not (on ?b1 ?b2 ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (clear ?b ?level)) (next-level-of-put-on-block ?level ?nlevel) ) (not (clear ?b ?nlevel)) ))
		(copied-neg-put-on-block ?level) 
		)
	)

	(:action copy_substate_pos_pick-tower
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not-in-pick-tower)
		(not (closed ?level))
		(not (copied-pos-pick-tower ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (holding ?b ?level) (next-level-of-pick-tower ?level ?nlevel) ) (holding ?b ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (emptyhand ?level) (next-level-of-pick-tower ?level ?nlevel) ) (emptyhand ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (on-table ?b ?level) (next-level-of-pick-tower ?level ?nlevel) ) (on-table ?b ?nlevel) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (on ?b1 ?b2 ?level) (next-level-of-pick-tower ?level ?nlevel) ) (on ?b1 ?b2 ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (clear ?b ?level) (next-level-of-pick-tower ?level ?nlevel) ) (clear ?b ?nlevel) ))
		(copied-pos-pick-tower ?level) 
		(not (not-in-pick-tower)) 
		)
	)

	(:action copy_substate_neg_pick-tower
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-put-tower-on-block)
		(not (not-in-pick-tower))
		(not (closed ?level))
		(copied-pos-pick-tower ?level)
		(not (copied-neg-pick-tower ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (holding ?b ?level)) (next-level-of-pick-tower ?level ?nlevel) ) (not (holding ?b ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (emptyhand ?level)) (next-level-of-pick-tower ?level ?nlevel) ) (not (emptyhand ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (on-table ?b ?level)) (next-level-of-pick-tower ?level ?nlevel) ) (not (on-table ?b ?nlevel)) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (not (on ?b1 ?b2 ?level)) (next-level-of-pick-tower ?level ?nlevel) ) (not (on ?b1 ?b2 ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (clear ?b ?level)) (next-level-of-pick-tower ?level ?nlevel) ) (not (clear ?b ?nlevel)) ))
		(copied-neg-pick-tower ?level) 
		)
	)

	(:action copy_substate_pos_put-tower-on-block
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed ?level))
		(not (copied-pos-put-tower-on-block ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (holding ?b ?level) (next-level-of-put-tower-on-block ?level ?nlevel) ) (holding ?b ?nlevel) ))
		( forall ( ?nlevel - levelType)
			(when (and (emptyhand ?level) (next-level-of-put-tower-on-block ?level ?nlevel) ) (emptyhand ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (on-table ?b ?level) (next-level-of-put-tower-on-block ?level ?nlevel) ) (on-table ?b ?nlevel) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (on ?b1 ?b2 ?level) (next-level-of-put-tower-on-block ?level ?nlevel) ) (on ?b1 ?b2 ?nlevel) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (clear ?b ?level) (next-level-of-put-tower-on-block ?level ?nlevel) ) (clear ?b ?nlevel) ))
		(copied-pos-put-tower-on-block ?level) 
		(not (not-in-put-tower-on-block)) 
		)
	)

	(:action copy_substate_neg_put-tower-on-block
	:parameters  ( ?level - levelType)
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not (not-in-put-tower-on-block))
		(not (closed ?level))
		(copied-pos-put-tower-on-block ?level)
		(not (copied-neg-put-tower-on-block ?level))
		)
	:effect 
		(and
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (holding ?b ?level)) (next-level-of-put-tower-on-block ?level ?nlevel) ) (not (holding ?b ?nlevel)) ))
		( forall ( ?nlevel - levelType)
			(when (and (not (emptyhand ?level)) (next-level-of-put-tower-on-block ?level ?nlevel) ) (not (emptyhand ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (on-table ?b ?level)) (next-level-of-put-tower-on-block ?level ?nlevel) ) (not (on-table ?b ?nlevel)) ))
		( forall ( ?b1 - block ?b2 - block ?nlevel - levelType)
			(when (and (not (on ?b1 ?b2 ?level)) (next-level-of-put-tower-on-block ?level ?nlevel) ) (not (on ?b1 ?b2 ?nlevel)) ))
		( forall ( ?b - block ?nlevel - levelType)
			(when (and (not (clear ?b ?level)) (next-level-of-put-tower-on-block ?level ?nlevel) ) (not (clear ?b ?nlevel)) ))
		(copied-neg-put-tower-on-block ?level) 
		)
	)

	(:action goal_achieved_level_0_0
	:parameters  ()
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_0_0))
		(closed level_1_1)
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_0_0)
		(on-table b1 level_0_0)
		(on-table b2 level_0_0)
		(on-table b3 level_0_0)
		(on b4 b1 level_0_0)
		(on b5 b2 level_0_0)
		(clear b3 level_0_0)
		(clear b4 level_0_0)
		(clear b5 level_0_0)
		)
	:effect 
		 
		(closed level_0_0) 
 
	)

	(:action goal_achieved_level_1_1
	:parameters  ()
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_1_1))
		(closed level_2_1)
		(closed level_3_1)
		(emptyhand level_1_1)
		(on-table b1 level_1_1)
		(on-table b2 level_1_1)
		(on-table b3 level_1_1)
		(on b4 b1 level_1_1)
		(on b5 b2 level_1_1)
		(clear b3 level_1_1)
		(clear b4 level_1_1)
		(clear b5 level_1_1)
		)
	:effect 
		 
		(closed level_1_1) 
 
	)

	(:action goal_achieved_level_2_1
	:parameters  ()
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_2_1))
		(closed level_3_1)
		(emptyhand level_2_1)
		(on-table b1 level_2_1)
		(on-table b2 level_2_1)
		(on-table b3 level_2_1)
		(on b4 b1 level_2_1)
		(on b5 b2 level_2_1)
		(clear b3 level_2_1)
		(clear b4 level_2_1)
		(clear b5 level_2_1)
		)
	:effect 
		 
		(closed level_2_1) 
 
	)

	(:action goal_achieved_level_3_1
	:parameters  ()
	:precondition 
		(and
		(not-in-pick-up)
		(not-in-pick-up-from-table)
		(not-in-put-on-block)
		(not-in-pick-tower)
		(not-in-put-tower-on-block)
		(not (closed level_3_1))
		(emptyhand level_3_1)
		(on-table b1 level_3_1)
		(on-table b2 level_3_1)
		(on-table b3 level_3_1)
		(on b4 b1 level_3_1)
		(on b5 b2 level_3_1)
		(clear b3 level_3_1)
		(clear b4 level_3_1)
		(clear b5 level_3_1)
		)
	:effect 
		 
		(closed level_3_1) 
 
	)
)