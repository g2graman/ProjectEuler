#!/bin/bash

if ([ -z "$RACKET_VERSION" ]); then
	echo "Racket version environment variable not set, setting default"
	export RACKET_VERSION=HEAD  # set default Racket version
	echo "Version: $RACKET_VERSION" 
fi

if ([ -z "$RACKET_DIR" ]); then
	echo "Racket directory environment variable not set, setting default"
	export RACKET_DIR='/usr/racket'  # set default Racket directory
	echo "Directory: $RACKET_DIR" 
fi

if ([ ! -e cache ] || [ ! -d cache ]); then
	echo "Creating cache folder ..."
	mkdir cache
fi

cd cache

INSTALL=$(ls | grep ^racket*.sh | tr -d [:blank:])
if ([ ! -e "$RACKET_DIR" ] || [ ! -d "$RACKET_DIR" ]); then
	if ([ -z "$INSTALL" ]); then
		echo "Racket installation script not found, building."
		
		if ([ ! -e travis-racket ] || [ ! -d travis-racket ] \
		|| [ ! -e travis-racket/install-racket.sh ] \
		|| [ ! -f travis-racket/install-racket.sh ]); then
			git clone https://github.com/greghendershott/travis-racket.git
		fi
		cat travis-racket/install-racket.sh | bash
	else
		./$INSTALL
	fi
fi

which racket &>/dev/null
ESTATUS=$?
if([ -n $ESTATUS ]); then
	echo "Adding racket to PATH"
	export PATH="${PATH}:${RACKET_DIR}/bin"
fi

cd ..
