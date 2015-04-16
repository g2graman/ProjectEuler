#!/bin/bash
# Requires sudo privileges

if ([ -z "$RACKET_VERSION" ]); then
	echo "Racket version environment variable not set, setting default"
	echo "Version: HEAD" 
	RACKET_VERSION=HEAD  # set default Racket version
fi

if ([ -z "$RACKET_DIR" ]); then
	echo "Racket directory environment variable not set, setting default"
	echo "Directory: /usr/racket" 
	RACKET_DIR='/usr/racket'  # set default Racket version
fi

if ([ ! -e cache ] || [ ! -d cache ]); then
	echo "Creating cache folder ..."
	mkdir cache
fi

cd cache

INSTALL=$(ls | grep ^racket*.sh | tr -d [:blank:])
if ([ ! -e /usr/racket ] || [ ! -d /usr/racket ]); then
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

alias racket="${RACKET_DIR}/bin/racket"
cd ..
