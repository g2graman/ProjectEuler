#lang racket

(define (iter [a 2] [b 2] [acc (set)])
  (let ([s (set-union acc (set (expt a b)))])
    (if (and (eq? b 100) (eq? a 100))
        (length (set->list s))
        (if (eq? b 100)
            (iter (+ a 1) 2 s)
            (iter a (+ b 1) s)))))
 
 (iter)
