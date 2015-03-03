#lang racket

(require math)


(define (prime-factors n [lst (reverse (factorize n))])
  (if (> (length lst) 0)
      (if (prime? (first (first lst)))
          (first (first lst))
          (prime-factors n (rest lst)))
      0))

(prime-factors 600851475143)