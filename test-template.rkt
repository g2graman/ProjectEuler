(require racket/file)
(require rackunit)
(require rackunit/text-ui)

(require "FILE-REPLACE")

(define cd
	(path->string (current-directory)))

(define f 
	(string-append
	(path->string (path->directory-path cd))
	"answer.txt"))

(define expected (string->number (list-ref (file->lines f) 0)))
(define actual answer)

(define-test-suite test 
  (test-suite
   (string-append "Tests for " "FILE-REPLACE")
   (test-begin
    (check-equal? actual expected))))

(run-tests test 'quiet)
