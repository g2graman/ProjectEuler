.PHONY: all
all: clean testdepend run

.PHONY: run
run: testdepend
	bashcov --skip-uncovered ./run.sh

.PHONY: testdepend
testdepend:
	test -s ./bin/icdiff || \
	mkdir -p bin && \
	curl -s https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.7.2/icdiff | tee bin/icdiff > /dev/null \
	&& chmod ugo+rx ./bin/icdiff

.PHONY: clean
clean:
	./clean.sh
