#!/bin/bash 
 
echo "Desc: Convert FOND PDDL domain and problem into preprocessed"
echo "	SAS format to be fed into PRP downward module"


TRANS=~/school/thesis/ft-prp/PRP/src/translate/translate.py
PREPROCESS=~/school/thesis/ft-prp/PRP/src/preprocess/preprocess
FTD="java -jar `echo ~/school/thesis/ft-prp/FT/bin/ftConverter/FT.jar`"
if [ "$#" -ne 3 ]; then
    echo "Usage: ftd.sh <domain PDDL> <problem PDDL> <max_faults>"
    exit -1
fi

echo "Running Fault Tolerant Determinization on $(basename $1) and $(basename $2)..."
$FTD -f $1 $2 $3

echo "Translating output domain and problem to SAS+..."
$TRANS 1000 outputDom.pddl outputProb.pddl

echo "Preprocessing output.sas into output..."
$PREPROCESS < ./output.sas 

read -r -p "Clean intermediate products (.xml, and .sas files) [y/n](y)?" response
case $response in
    [nN][oO]|[nN]) 
        ;;
    *)
        rm ./domain.xml ./problem.xml ./properties.xml ./output.sas --interactive=never

        ;;
esac

read -r -p "Clean FTD PDDL files [y/n](n)?" response
case $response in
    [yY][eE][sS]|[yY]) 
        rm outputDom.pddl outputProb.pddl --interactive=never
        ;;
    *)
        ;;
        
esac
