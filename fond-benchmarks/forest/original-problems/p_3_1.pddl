(define (problem p3)
 (:domain forest)
 (:objects
           x1 y1  x2 y2  x3 y3  - location
		 sx1 sy1  sx2 sy2  sx3 sy3  - sub-location
 )
 (:init 
	;;;;;;;;top level grid;;;;;;;
	(at-x x1) 
	(at-y y1)
(succ-loc x1 x2)
(succ-loc y1 y2)
(succ-loc x2 x3)
(succ-loc y2 y3)
	(ninitialized x1 y1)
	(ninitialized x1 y2)
	(ninitialized x1 y3)
	(ninitialized x2 y1)
	(ninitialized x2 y2)
	(ninitialized x2 y3)
	(ninitialized x3 y1)
	(ninitialized x3 y2)
	(ninitialized x3 y3)
	;;;;;;;;subproblems;;;;;;;;;;
  (problem-at x1 y1 grid)
  (problem-at x1 y2 grid)
  (problem-at x1 y3 blocksworld)
  (problem-at x2 y1 blocksworld)
  (problem-at x2 y2 logistics)
  (problem-at x2 y3 logistics)
  (problem-at x3 y1 logistics)
  (problem-at x3 y2 grid)
  (problem-at x3 y3 grid)
        ;;;;;;;;enabling constraints;;
	(enabled x1 y1)
	(solved x1 y1)
  (enables x1 y1 x1 y2)
	(solved x1 y1)
  (enables x1 y2 x1 y3)
	(solved x1 y1)
	(solved x2 y2)
  (enables x2 y1 x2 y2)
	(solved x2 y2)
  (enables x1 y3 x2 y3)
	(solved x2 y2)
	(solved x3 y3)
  (enables x3 y1 x3 y2)
	(solved x3 y3)
  (enables x2 y3 x3 y3)
	(solved x3 y3)
	;;;;;;;;grid sub-problem;;;;;;
	(s-init-x sx3)
	(s-init-y sy3)
	(s-goal-x sx1)
	(s-goal-y sy1)
(succ-loc sx1 sx2)
(succ-loc sy1 sy2)
(succ-loc sx2 sx3)
(succ-loc sy2 sy3)
	;;;;;;logistics sub-problem;;
                (s-city-loc l11 c1) (s-city-loc l12 c1)
                (s-city-loc l21 c2) (s-city-loc l22 c2)
		(s-airport-loc l11) (s-airport-loc l21)
 )
 (:goal 
	(and (at-x x3) (at-y y3))
 )
)
