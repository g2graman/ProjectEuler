#lang racket

(define answer (foldl + 0 
                      (filter 
                       (lambda (x) 
                         (or 
                          (eq? (modulo x 3) 0)
                          (eq? (modulo x 5) 0))) 
                       (range 1 1000))))
answer