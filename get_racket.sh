#!/bin/bash

if ([ ! -e travis-racket ] && [ ! -d travis-racket ]); then
	git clone https://github.com/greghendershott/travis-racket.git
	cat travis-racket/install-racket.sh | bash
	export PATH="${RACKET_DIR}/bin:${PATH}"
fi
