#lang racket

(require math)
(require racket/set)

(provide comps)
(define comps (set))

(define (add n)
  (set! comps (set-add comps n)))

(define (sieve limit [cur 2] [countPrimes 0])
      (if (set-member? comps cur)
      (sieve limit (+ cur 1) countPrimes)
      (if (prime? cur)
          (if (>= (+ countPrimes 1) limit)
              cur
              (sieve limit (+ cur 1) (+ countPrimes 1)))
          (begin
            (add cur)
            (sieve limit (+ cur 1) countPrimes)))))

(sieve 10001)