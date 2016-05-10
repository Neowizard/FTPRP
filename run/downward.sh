#! /bin/bash
echo $1
../Debug/downward_debug --heuristic "h=ff(cost_type=1)" --search "lazy_greedy([h],preferred=[h])" --random-seed 814102613 --input $1 --debug-output 1
