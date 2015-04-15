#lang lazy

(require racket/lazy-require)
(lazy-require [math (divisors)])

(define (triangular [cur 0] [acc 0] [ndiv 500])
  (if (>= (length (divisors acc)) ndiv)
      acc
      (triangular (+ cur 1) (+ acc (+ 1 cur)) ndiv)))

(define answer (triangular))
;answer
(provide answer)
