#!/bin/bash


if ([ -z "$RACKET_VERSION" ]); then
	export RACKET_VERSION=HEAD  # set default Racket version
fi

if ([ ! -e cache ] && [ ! -d cache  ]); then
	echo "Creating cache folder ..."
	mkdir cache
fi

cd cache

INSTALL=$(ls | grep ^racket*.sh)
if ([ -z "$INSTALL" ]); then
	echo "Racket installation script not found, building."
	git clone https://github.com/greghendershott/travis-racket.git
	cat travis-racket/install-racket.sh | bash
fi

cd ..
cache/racket-${RACKET_VERSION}.sh

export PATH="${RACKET_DIR}/bin:${PATH}"
