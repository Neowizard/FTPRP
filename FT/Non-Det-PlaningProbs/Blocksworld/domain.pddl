(define (domain blocks-domain)

(:requirements :non-deterministic :equality :typing :negative-preconditions)

(:types block_t)

(:predicates 
	(inhand ?block - block_t) 
	(emptyhand) 
	(on ?block ?on_block - block_t) 
	(clear ?block - block_t)
)

(:action pick_up
    :parameters (?block ?from_block - block_t)
    :precondition (and 
		(emptyhand) (clear ?block) (on ?block ?from_block))
    :effect (oneof
             (and (inhand ?block) (clear ?from_block) (not (emptyhand)) (not (on ?block ?from_block)))
             (and))
)

(:action put_down
    :parameters (?block ?on_block - block_t)
    :precondition (and 
		(not (emptyhand)) (clear ?on_block) (inhand ?block))
    :effect (oneof
             (and (on ?block ?on_block) (emptyhand) (not (inhand ?block)) (not (clear ?on_block)))
             (and))
  )
)

