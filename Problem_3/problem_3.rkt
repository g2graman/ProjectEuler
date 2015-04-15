#lang lazy

(require racket/lazy-require)
(lazy-require [math (factorize prime?)])

(define (prime-factors n [lst (reverse (factorize n))])
  (if (> (length lst) 0)
      (if (prime? (first (first lst)))
          (first (first lst))
          (prime-factors n (rest lst)))
      0))

(define answer (prime-factors 600851475143))
;answer
(provide answer)
