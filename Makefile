.PHONY: all
all: clean testdepend run

.PHONY: run
run: testdepend
	scripts/run_tests.sh

.PHONY: testdepend
testdepend: bash_testdepend racket_testdepend

.PHONY: bash_testdepend
bash_testdepend:
	test -s ./bin/icdiff || \
	mkdir -p bin && \
	curl -s https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.7.2/icdiff | tee bin/icdiff > /dev/null \
	&& chmod ugo+rx ./bin/icdiff
	
.PHONY: racket_testdepend
racket_testdepend:
	scripts/get_cover.sh

.PHONY: clean
clean:
	scripts/clean.sh
