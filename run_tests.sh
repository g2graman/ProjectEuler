#!/bin/bash

#ICDIFF=icdiff
#if [ -d ./bin ] && [ -f ./bin/icdiff ]; then
#    ICDIFF=./bin/icdiff
#fi


if [ -z "${1-}" ]; then
	for file in $(ls); do
		if [ $(ls $file | grep answer.txt | wc -w) -gt 0 ]; then 
			SELECTED_FIXTURES="$SELECTED_FIXTURES $file";
		fi
	done
else
	SELECTED_FIXTURES=$1
fi

TEMPLATE=`cat test-template.rkt`
ERR=0

for fixture in $SELECTED_FIXTURES; do
	echo "fixture: $fixture"
	FILE_TO_TEST=$(ls $fixture | grep -P -x 'problem_[0-9]+\.rkt')
	TEST_CASE=${TEMPLATE//"FILE-REPLACE"/$FILE_TO_TEST}
	echo $FILE_TO_TEST
	cd $fixture
	RESULT=$(racket -e "$TEST_CASE")
	ESTATUS=`echo $RESULT | cut -d " " -f 2`
	OUTPUT=`echo $RESULT | cut -d " " -f 1`
	#echo $OUTPUT
	#echo $RESULT
	cd ..
	#EXPECTED=$(cat "$fixture/$(ls $fixture | grep answer.txt | head -1 | cat)")
	#"$ICDIFF" -L "actual (racket)" -L "expected (from answer.txt)" --line-numbers <(echo "$RESULT") <(echo "$EXPECTED")
	#diff <(echo "$RESULT") <(echo "$EXPECTED") &>/dev/null
	ESTATUS=$?
	if [ ! $ERR ] || [ ! $ESTATUS ]; then ERR=1; fi  #set error status
done

exit $ESTATUS
