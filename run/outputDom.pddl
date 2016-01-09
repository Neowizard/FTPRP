(define (domain blocks-domain)
(:requirements :equality :negative-preconditions :typing :conditional-effects)
	(:types block_t levelType dummyType)
	(:predicates
		(inhand ?block - block_t ?level - levelType)
		(emptyhand ?level - levelType)
		(on ?block - block_t ?on_block - block_t ?level - levelType)
		(clear ?block - block_t ?level - levelType)
		(closed ?level - levelType)
	)


	(:action pick_up_0_0_FTD_e1
	:parameters  ( ?block - block_t ?from_block - block_t)
	:precondition 
		(and
		(not (closed level_0_0))
		(closed level_1_1)
		(emptyhand level_0_0)
		(clear ?block level_0_0)
		(on ?block ?from_block level_0_0)
		)
	:effect 
		 
		(and (not (closed level_1_0)) (inhand ?block level_1_0) (clear ?from_block level_1_0) (not (emptyhand level_1_0)) (not (on ?block ?from_block level_1_0)) )
 
	)

	(:action pick_up_1_0_FTD_e0
	:parameters  ( ?block - block_t ?from_block - block_t)
	:precondition 
		(and
		(not (closed level_1_0))
		(closed level_1_1)
		(emptyhand level_1_0)
		(clear ?block level_1_0)
		(on ?block ?from_block level_1_0)
		)
	:effect 
		 
		(and (inhand ?block level_1_0) (clear ?from_block level_1_0) (not (emptyhand level_1_0)) (not (on ?block ?from_block level_1_0)) )
 
	)

	(:action pick_up_1_1_FTD_e0
	:parameters  ( ?block - block_t ?from_block - block_t)
	:precondition 
		(and
		(not (closed level_1_1))
		(emptyhand level_1_1)
		(clear ?block level_1_1)
		(on ?block ?from_block level_1_1)
		)
	:effect 
		 
		(and (inhand ?block level_1_1) (clear ?from_block level_1_1) (not (emptyhand level_1_1)) (not (on ?block ?from_block level_1_1)) )
 
	)

	(:action goal_achieved_level_0_0
	:parameters  ()
	:precondition 
		(and
		)
	:effect 
		 
		(closed level_0_0) 
 
	)

	(:action goal_achieved_level_1_0
	:parameters  ()
	:precondition 
		(and
		(not (closed level_1_0))
		(closed level_1_1)
		(emptyhand level_1_0)
		)
	:effect 
		 
		(closed level_1_0) 
 
	)

	(:action goal_achieved_level_1_1
	:parameters  ()
	:precondition 
		(and
		(not (closed level_1_1))
		(emptyhand level_1_1)
		)
	:effect 
		 
		(closed level_1_1) 
 
	)
)
