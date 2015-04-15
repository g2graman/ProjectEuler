#lang lazy

(require racket/lazy-require)
(lazy-require [racket/file 
	(explode-path find-system-path path->directory-path
	path->string file->lines)])
(lazy-require [racket/string (string-split string-replace)])
(lazy-require [racket/list (range)])

(define cd
	(list-ref (explode-path (find-system-path 'run-file)) 0))
	
(define f 
	(string-append
	(path->string (path->directory-path cd))
	"p022_names.txt"))

(define names (sort
               (string-split 
                (string-replace 
                 (list-ref 
                  (file->lines f) 0)  "\"" "") ",") 
               string<?))

(define counts (map 
              (lambda (name) 
                (foldl + 0 
                       (map 
                        (lambda (i) (- 
                                     (char->integer (string-ref name i)) 
                                     64)) 
                        (range (string-length name)))))
              names))
  (define answer (foldl + 0 
         (map 
          (lambda (i) (* (+ i 1) (list-ref counts i))) 
          (range (length counts)))))
  ;answer
  (provide answer)
