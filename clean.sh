#!/bin/bash

rm -rf "$(comm -12  <(ls -a | awk '{print "./" $0}') <(cat .gitignore | sed '/^$/d; /^#/d' | awk '{print "./" $0}' | uniq | sort))"
