#lang lazy

(require racket/lazy-require)
(lazy-require [math (factorize)])

(define (sum-factors n) ; add the prime factors of n
  (apply + 
       (map 
        (lambda (factor) 
          (* (first factor) (first (rest factor)))) (factorize n))))

(define (chain-factors n [acc 0]) ; find the sum of all prime factors of n!
  (if (eq? n 2)
      (+ acc 2)
      (chain-factors (- n 1) (+ acc (sum-factors n))))) ; take advantage of tail-call optimization

(define n 20000000)
(define k 15000000)

(define (sum-prime-factors-binomial n k)
  (if (< (- n k) k)
      (sum-prime-factors-binomial n (- n k))
      (- (chain-factors n)  ; subtract from sum of all prime factors of n 
     (+ (chain-factors k) (chain-factors (- n k))) ; sum of prime factors of k!(n-k)!
     )))

(define answer (sum-prime-factors-binomial n k))
answer
(provide answer)
