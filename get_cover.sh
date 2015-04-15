#!/bin/bash

if ([ ! -e bin ] && [ ! -d bin  ]); then
	mkdir bin
fi

cd bin

if ([ ! -e cover ] && [ ! -d cover ]); then
	git clone https://github.com/florence/cover.git
fi

cd ..
