#!/bin/bash

REMOVE="$(comm -12  <(ls -aR | awk '{print "./" $0}' | sort) <(cat .gitignore | sed '/^$/d; /^#/d' | awk '{print "./" $0}' | uniq | sort))"
if [ -n "$REMOVE" ]; then
	echo "REMOVING: $REMOVE"
	rm -rf $REMOVE
else
	echo "REMOVING: Nothing"
fi
