#lang lazy

(require racket/lazy-require)
(lazy-require [racket/list (drop take range)])

(define (merge-lcm lst)
  (if (<= (length lst) 2)
      (if (eq? (length lst) 2)
          (lcm (first lst) (first (rest lst)))
          (first lst))
      (if (> (modulo (length lst) 2) 0)
          (lcm (merge-lcm (take lst (floor (/ (length lst) 2)))) 
               (list-ref lst (+ (floor (/ (length lst) 2)) (modulo (length lst) 2))) 
               (merge-lcm (drop lst (floor (/ (length lst) 2)))))
          (lcm (merge-lcm (take lst (floor (/ (length lst) 2)))) (merge-lcm (drop lst (floor (/ (length lst) 2))))))))

(define answer (merge-lcm (range 1 21)))
;answer
(provide answer)
