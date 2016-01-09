#!/bin/bash 
 
echo "Desc: Convert FOND PDDL domain and problem into preprocessed"
echo "	SAS format to be fed into PRP downward module"

TRANS=~/school/thesis/ft-prp/PRP/src/translate/translate.py
PREPROCESS=~/school/thesis/ft-prp/PRP/src/preprocess/preprocess
if [ "$#" -lt 2 ]; then
    echo "Usage: aod.sh <domain PDDL> <problem PDDL>"
    exit -1
fi

mv ./output.sas ./output.sas.tmp &> /dev/null
echo "Translating output domain and problem to SAS+..."
$TRANS 1000 $1 $2

mv ./output ./output.tmp &> /dev/null
echo "Preprocessing output.sas into output..."
$PREPROCESS < ./output.sas 


read -r -p "Clean intermediate products (.sas.aod files) [y/n](y)" response
case $response in
    [nN][oO]|[nN]) 
        ;;
    *)
        rm ./output.sas --interactive=never
        ;;
esac

mv ./output.sas ./output.sas.aod &> /dev/null 
mv ./output ./output.aod 
mv ./output.sas.tmp ./output.sas &> /dev/null
mv ./output.tmp ./output &> /dev/null
