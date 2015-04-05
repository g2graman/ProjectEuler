#!/bin/bash


ICDIFF=icdiff
if [ -f ./bin/icdiff ]; then
    ICDIFF=./bin/icdiff
fi

for file in $(ls); do
	if [ $(ls $file | grep answer.txt | wc -w) -gt 0 ]; then 
		SELECTED_FIXTURES="$SELECTED_FIXTURES $file";
	fi
done

ERR=0

for fixture in $SELECTED_FIXTURES; do
	echo "fixture: $fixture"
	ACTUALS=$(ls $fixture | grep .rkt)
	EXPECTED=$(cat "$fixture/$(ls $fixture | grep answer.txt | head -1 | cat)")
	#echo "$ACTUALS: $EXPECTED"
	for file in "$ACTUALS"; do
		ACTUAL=$(racket "$fixture/$file")
		"$ICDIFF" -L "actual (racket)" -L "expected (from answer.txt)" --line-numbers <(echo "$ACTUAL") <(echo "$EXPECTED")
	   	diff <(echo "$ACTUAL") <(echo "$EXPECTED") &>/dev/null
	   	ESTATUS=$?
        if [[ $ERR || ESTATUS ]]; then ERR=1; fi #set error status
	done
done

exit $ESTATUS

