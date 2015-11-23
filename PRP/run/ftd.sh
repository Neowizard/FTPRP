#!/bin/bash 
 
echo "Desc: Convert FOND PDDL domain and problem pairs into preprocessed"
echo "	SAS format to be fed into PRP downward module"


if [ "$#" -ne 3 ]; then
    echo "Usage: <script> <domain PDDL> <problem PDDL> <max_faults>"
    exit -1
fi

echo "Running Fault Tolerant Determinization on $(basename $1) and $(basename $2)..."
java -jar ~/school/thesis/ft-prp/FT/bin/ftConverter/FT.jar -f $1 $2 $3

echo "Translating output domain and problem to SAS+..."
~/school/thesis/ft-prp/PRP/src/translate/translate.py 1000 outputDom.pddl outputProb.pddl

echo "Preprocessing output.sas into output..."
~/school/thesis/ft-prp/PRP/src/preprocess/preprocess < ./output.sas 

read -r -p "Clean intermediate products (.xml, .pddl and .sas files) [y(default)/n]" response
case $response in
    [nN][oO]|[nN]) 
        ;;
    *)
        rm ./domain.xml ./problem.xml ./properties.xml ./outputDom.pddl ./outputProb.pddl output.sas --interactive=never
        ;;
esac
