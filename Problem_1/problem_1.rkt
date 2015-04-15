#lang lazy

(require racket/lazy-require)
(lazy-require [racket/list (range)])

(define answer (foldl + 0 
                      (filter 
                       (lambda (x) 
                         (or 
                          (eq? (modulo x 3) 0)
                          (eq? (modulo x 5) 0))) 
                       (range 1 1000))))
;answer
(provide answer)
