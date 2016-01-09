#!/bin/bash

FF=~/school/thesis/ft-prp/FF/ff

if [ "$#" -ne 2 ]; then
	echo "Usage: ff.sh <domain.pddl> <problem.pddl> [ff options...]"
	exit -1
fi

$FF $3 $4 $5 $6 $7 $8 -o $1 -f $2
