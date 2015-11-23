(define (domain blocks-domain)
(:requirements :equality :negative-preconditions :typing :conditional-effects)
	(:types block levelType)
	(:predicates
		(holding ?b - block ?level - levelType)
		(emptyhand ?level - levelType)
		(on-table ?b - block ?level - levelType)
		(on ?b1 - block ?b2 - block ?level - levelType)
		(clear ?b - block ?level - levelType)
		(closed ?level - levelType)
	)

	(:action pick-up_0_0_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(not (= ?b1 ?b2))
		(emptyhand level_0_0)
		(clear ?b1 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		(and
		(and (holding ?b1 level_0_0) (clear ?b2 level_0_0) (not (emptyhand level_0_0)) (not (clear ?b1 level_0_0)) (not (on ?b1 ?b2 level_0_0)) )
		( forall ( ?b - block)
			(when ((holding ?b level_0_0) ) (holding ?b level_1_1) ))
		( forall ()
			(when ((emptyhand level_0_0) ) (emptyhand level_1_1) ))
		( forall ( ?b - block)
			(when ((not (holding ?b level_0_0)) ) (not (holding ?b level_1_1)) ))
		( forall ()
			(when ((not (emptyhand level_0_0)) ) (not (emptyhand level_1_1)) ))
		(and (not (closed level_1_1)) (clear ?b2 level_1_1) (on-table ?b1 level_1_1) (not (on ?b1 ?b2 level_1_1)) )
		)
	)

	(:action pick-up_0_0_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(not (= ?b1 ?b2))
		(emptyhand level_0_0)
		(clear ?b1 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		(and
		( forall ( ?b - block)
			(when ((on-table ?b level_0_0) ) (on-table ?b level_1_0) ))
		( forall ( ?b - block)
			(when ((not (on-table ?b level_0_0)) ) (not (on-table ?b level_1_0)) ))
		(and (not (closed level_1_0)) (holding ?b1 level_1_0) (clear ?b2 level_1_0) (not (emptyhand level_1_0)) (not (clear ?b1 level_1_0)) (not (on ?b1 ?b2 level_1_0)) )
		(and (clear ?b2 level_0_0) (on-table ?b1 level_0_0) (not (on ?b1 ?b2 level_0_0)) )
		)
	)

	(:action pick-up_1_1_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(not (= ?b1 ?b2))
		(emptyhand level_1_1)
		(clear ?b1 level_1_1)
		(on ?b1 ?b2 level_1_1)
		)
	:effect 
		 
		(and (holding ?b1 level_1_1) (clear ?b2 level_1_1) (not (emptyhand level_1_1)) (not (clear ?b1 level_1_1)) (not (on ?b1 ?b2 level_1_1)) )
 
	)

	(:action pick-up_1_1_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(not (= ?b1 ?b2))
		(emptyhand level_1_1)
		(clear ?b1 level_1_1)
		(on ?b1 ?b2 level_1_1)
		)
	:effect 
		 
		(and (clear ?b2 level_1_1) (on-table ?b1 level_1_1) (not (on ?b1 ?b2 level_1_1)) )
 
	)

	(:action pick-up-from-table_0_0_FTD_e0
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(emptyhand level_0_0)
		(clear ?b level_0_0)
		(on-table ?b level_0_0)
		)
	:effect 
		(and
		( forall ( ?b1 - block ?b2 - block)
			(when ((on ?b1 ?b2 level_0_0) ) (on ?b1 ?b2 level_1_1) ))
		( forall ( ?b - block)
			(when ((clear ?b level_0_0) ) (clear ?b level_1_1) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((not (on ?b1 ?b2 level_0_0)) ) (not (on ?b1 ?b2 level_1_1)) ))
		( forall ( ?b - block)
			(when ((not (clear ?b level_0_0)) ) (not (clear ?b level_1_1)) ))
		(and (not (closed level_1_1)) (holding ?b level_1_1) (not (emptyhand level_1_1)) (not (on-table ?b level_1_1)) )
		)
	)

	(:action pick-up-from-table_0_0_FTD_e1
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(emptyhand level_0_0)
		(clear ?b level_0_0)
		(on-table ?b level_0_0)
		)
	:effect 
		(and
		( forall ( ?b - block)
			(when ((holding ?b level_0_0) ) (holding ?b level_1_0) ))
		( forall ()
			(when ((emptyhand level_0_0) ) (emptyhand level_1_0) ))
		( forall ( ?b - block)
			(when ((on-table ?b level_0_0) ) (on-table ?b level_1_0) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((on ?b1 ?b2 level_0_0) ) (on ?b1 ?b2 level_1_0) ))
		( forall ( ?b - block)
			(when ((clear ?b level_0_0) ) (clear ?b level_1_0) ))
		( forall ( ?b - block)
			(when ((not (holding ?b level_0_0)) ) (not (holding ?b level_1_0)) ))
		( forall ()
			(when ((not (emptyhand level_0_0)) ) (not (emptyhand level_1_0)) ))
		( forall ( ?b - block)
			(when ((not (on-table ?b level_0_0)) ) (not (on-table ?b level_1_0)) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((not (on ?b1 ?b2 level_0_0)) ) (not (on ?b1 ?b2 level_1_0)) ))
		( forall ( ?b - block)
			(when ((not (clear ?b level_0_0)) ) (not (clear ?b level_1_0)) ))
		(not (closed level_1_0)) 
		(and (holding ?b level_0_0) (not (emptyhand level_0_0)) (not (on-table ?b level_0_0)) )
		)
	)

	(:action pick-up-from-table_1_1_FTD_e0
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(emptyhand level_1_1)
		(clear ?b level_1_1)
		(on-table ?b level_1_1)
		)
	:effect 
		
	)

	(:action pick-up-from-table_1_1_FTD_e1
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(emptyhand level_1_1)
		(clear ?b level_1_1)
		(on-table ?b level_1_1)
		)
	:effect 
		 
		(and (holding ?b level_1_1) (not (emptyhand level_1_1)) (not (on-table ?b level_1_1)) )
 
	)

	(:action put-on-block_0_0_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b1 level_0_0)
		(clear ?b2 level_0_0)
		)
	:effect 
		(and
		(and (on ?b1 ?b2 level_0_0) (emptyhand level_0_0) (clear ?b1 level_0_0) (not (holding ?b1 level_0_0)) (not (clear ?b2 level_0_0)) )
		( forall ( ?b1 - block ?b2 - block)
			(when ((on ?b1 ?b2 level_0_0) ) (on ?b1 ?b2 level_1_1) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((not (on ?b1 ?b2 level_0_0)) ) (not (on ?b1 ?b2 level_1_1)) ))
		(and (not (closed level_1_1)) (on-table ?b1 level_1_1) (emptyhand level_1_1) (clear ?b1 level_1_1) (not (holding ?b1 level_1_1)) )
		)
	)

	(:action put-on-block_0_0_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b1 level_0_0)
		(clear ?b2 level_0_0)
		)
	:effect 
		(and
		( forall ( ?b - block)
			(when ((on-table ?b level_0_0) ) (on-table ?b level_1_0) ))
		( forall ( ?b - block)
			(when ((not (on-table ?b level_0_0)) ) (not (on-table ?b level_1_0)) ))
		(and (not (closed level_1_0)) (on ?b1 ?b2 level_1_0) (emptyhand level_1_0) (clear ?b1 level_1_0) (not (holding ?b1 level_1_0)) (not (clear ?b2 level_1_0)) )
		(and (on-table ?b1 level_0_0) (emptyhand level_0_0) (clear ?b1 level_0_0) (not (holding ?b1 level_0_0)) )
		)
	)

	(:action put-on-block_1_1_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(holding ?b1 level_1_1)
		(clear ?b2 level_1_1)
		)
	:effect 
		 
		(and (on ?b1 ?b2 level_1_1) (emptyhand level_1_1) (clear ?b1 level_1_1) (not (holding ?b1 level_1_1)) (not (clear ?b2 level_1_1)) )
 
	)

	(:action put-on-block_1_1_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(holding ?b1 level_1_1)
		(clear ?b2 level_1_1)
		)
	:effect 
		 
		(and (on-table ?b1 level_1_1) (emptyhand level_1_1) (clear ?b1 level_1_1) (not (holding ?b1 level_1_1)) )
 
	)

	(:action put-down_0_0_
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b level_0_0)
		)
	:effect 
		 
		(and (on-table ?b level_0_0) (emptyhand level_0_0) (clear ?b level_0_0) (not (holding ?b level_0_0)) )
 
	)

	(:action put-down_0_0_
	:parameters  ( ?b - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b level_0_0)
		)
	:effect 
		 
		(and (on-table ?b level_0_0) (emptyhand level_0_0) (clear ?b level_0_0) (not (holding ?b level_0_0)) )
 
	)

	(:action pick-tower_0_0_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(emptyhand level_0_0)
		(on ?b1 ?b2 level_0_0)
		(on ?b2 ?b3 level_0_0)
		)
	:effect 
		(and
		( forall ( ?b - block)
			(when ((on-table ?b level_0_0) ) (on-table ?b level_1_1) ))
		( forall ( ?b - block)
			(when ((not (on-table ?b level_0_0)) ) (not (on-table ?b level_1_1)) ))
		(and (not (closed level_1_1)) (holding ?b2 level_1_1) (clear ?b3 level_1_1) (not (emptyhand level_1_1)) (not (on ?b2 ?b3 level_1_1)) )
		)
	)

	(:action pick-tower_0_0_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(emptyhand level_0_0)
		(on ?b1 ?b2 level_0_0)
		(on ?b2 ?b3 level_0_0)
		)
	:effect 
		(and
		( forall ( ?b - block)
			(when ((holding ?b level_0_0) ) (holding ?b level_1_0) ))
		( forall ()
			(when ((emptyhand level_0_0) ) (emptyhand level_1_0) ))
		( forall ( ?b - block)
			(when ((on-table ?b level_0_0) ) (on-table ?b level_1_0) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((on ?b1 ?b2 level_0_0) ) (on ?b1 ?b2 level_1_0) ))
		( forall ( ?b - block)
			(when ((clear ?b level_0_0) ) (clear ?b level_1_0) ))
		( forall ( ?b - block)
			(when ((not (holding ?b level_0_0)) ) (not (holding ?b level_1_0)) ))
		( forall ()
			(when ((not (emptyhand level_0_0)) ) (not (emptyhand level_1_0)) ))
		( forall ( ?b - block)
			(when ((not (on-table ?b level_0_0)) ) (not (on-table ?b level_1_0)) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((not (on ?b1 ?b2 level_0_0)) ) (not (on ?b1 ?b2 level_1_0)) ))
		( forall ( ?b - block)
			(when ((not (clear ?b level_0_0)) ) (not (clear ?b level_1_0)) ))
		(not (closed level_1_0)) 
		(and (holding ?b2 level_0_0) (clear ?b3 level_0_0) (not (emptyhand level_0_0)) (not (on ?b2 ?b3 level_0_0)) )
		)
	)

	(:action pick-tower_1_1_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(emptyhand level_1_1)
		(on ?b1 ?b2 level_1_1)
		(on ?b2 ?b3 level_1_1)
		)
	:effect 
		
	)

	(:action pick-tower_1_1_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(emptyhand level_1_1)
		(on ?b1 ?b2 level_1_1)
		(on ?b2 ?b3 level_1_1)
		)
	:effect 
		 
		(and (holding ?b2 level_1_1) (clear ?b3 level_1_1) (not (emptyhand level_1_1)) (not (on ?b2 ?b3 level_1_1)) )
 
	)

	(:action put-tower-on-block_0_0_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		(clear ?b3 level_0_0)
		)
	:effect 
		(and
		(and (on ?b2 ?b3 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) (not (clear ?b3 level_0_0)) )
		( forall ( ?b1 - block ?b2 - block)
			(when ((on ?b1 ?b2 level_0_0) ) (on ?b1 ?b2 level_1_1) ))
		( forall ( ?b - block)
			(when ((clear ?b level_0_0) ) (clear ?b level_1_1) ))
		( forall ( ?b1 - block ?b2 - block)
			(when ((not (on ?b1 ?b2 level_0_0)) ) (not (on ?b1 ?b2 level_1_1)) ))
		( forall ( ?b - block)
			(when ((not (clear ?b level_0_0)) ) (not (clear ?b level_1_1)) ))
		(and (not (closed level_1_1)) (on-table ?b2 level_1_1) (emptyhand level_1_1) (not (holding ?b2 level_1_1)) )
		)
	)

	(:action put-tower-on-block_0_0_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		(clear ?b3 level_0_0)
		)
	:effect 
		(and
		( forall ( ?b - block)
			(when ((on-table ?b level_0_0) ) (on-table ?b level_1_0) ))
		( forall ( ?b - block)
			(when ((not (on-table ?b level_0_0)) ) (not (on-table ?b level_1_0)) ))
		(and (not (closed level_1_0)) (on ?b2 ?b3 level_1_0) (emptyhand level_1_0) (not (holding ?b2 level_1_0)) (not (clear ?b3 level_1_0)) )
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
		)
	)

	(:action put-tower-on-block_1_1_FTD_e0
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(holding ?b2 level_1_1)
		(on ?b1 ?b2 level_1_1)
		(clear ?b3 level_1_1)
		)
	:effect 
		 
		(and (on ?b2 ?b3 level_1_1) (emptyhand level_1_1) (not (holding ?b2 level_1_1)) (not (clear ?b3 level_1_1)) )
 
	)

	(:action put-tower-on-block_1_1_FTD_e1
	:parameters  ( ?b1 - block ?b2 - block ?b3 - block)
	:precondition 
		(and
		(not (closed level_1_1))
		(holding ?b2 level_1_1)
		(on ?b1 ?b2 level_1_1)
		(clear ?b3 level_1_1)
		)
	:effect 
		 
		(and (on-table ?b2 level_1_1) (emptyhand level_1_1) (not (holding ?b2 level_1_1)) )
 
	)

	(:action put-tower-down_0_0_
	:parameters  ( ?b1 - block ?b2 - block)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
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
		(not (closed level_0_0))
		(closed level_1_1)
		(holding ?b2 level_0_0)
		(on ?b1 ?b2 level_0_0)
		)
	:effect 
		 
		(and (on-table ?b2 level_0_0) (emptyhand level_0_0) (not (holding ?b2 level_0_0)) )
 
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
)