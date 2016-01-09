#!/bin/bash 
 

echo "Translating output domain and problem to SAS+..."
~/school/thesis/ft-prp/PRP/src/translate/translate.py 1000 outputDom.pddl outputProb.pddl

echo "Preprocessing output.sas into output..."
~/school/thesis/ft-prp/PRP/src/preprocess/preprocess < ./output.sas 
rm ./output.sas --interactive=never
