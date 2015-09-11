# FT-PRP
Variation of the PRP (Planner for Relelvant Policiies) FOND (Fully Observable Non-Deterministic) 
planner that usesFault-Tolerant compilation instead of All-Outcomes-Determinization 

The original PRP was invented by Christian Muise, Sheila A. McIlraith and J. Christopher Beck.
The current version of PRP can be found at (mercurial repository):
https://bitbucket.org/haz/planner-for-relevant-policies
And the original paper:
http://haz.ca/papers/muise-icaps2012-fond.pdf

The fault-tolerant variation replaces the All-Outcomes-Determinization found in the original 
planner with a fault-tolerant compilation of the original FOND problem to solve more complex
problems with less replanning. The fault-tolerant compilation is a variation of the compilation
invented by Carmel Domshlak (http://iew3.technion.ac.il/~dcarmel/Papers/Sources/icaps13c.pdf), 
modified to fit the original PRP algorithm.
