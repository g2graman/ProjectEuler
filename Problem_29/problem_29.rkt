#lang racket

(define (iter [a 2] [b 2] [acc (mutable-set)])
  (if (and (eq? b 100) (eq? a 100))
      (begin (set-add! acc (expt a b))
        (length (set->list acc)))
      (if (eq? b 100)
          (begin 
            (set-add! acc (expt a b))
            (iter (+ a 1) 2 acc))
          (begin 
            (set-add! acc (expt a b))
             (iter a (+ b 1) acc)))))
 
 (iter)
