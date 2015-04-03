all: clean testdepend run

run: testdepend
	./run.sh

testdepend:
	test -s ./bin/icdiff || \
	mkdir -p bin && \
	curl -s https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.7.2/icdiff | tee bin/icdiff > /dev/null \
	&& chmod ugo+rx ./bin/icdiff

clean:
	rm -rf output bin
