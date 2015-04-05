#lang racket

(require racket/file)

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

(let 
    ([counts (map 
              (lambda (name) 
                (foldl + 0 
                       (map 
                        (lambda (i) (- 
                                     (char->integer (string-ref name i)) 
                                     64)) 
                        (range (string-length name)))))
              names)])
  (foldl + 0 
         (map 
          (lambda (i) (* (+ i 1) (list-ref counts i))) 
          (range (length counts)))))
