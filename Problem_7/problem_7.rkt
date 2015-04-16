#lang lazy

(require racket/lazy-require)
(lazy-require [math (prime?)])
(lazy-require [set (set-member? set set-add)])

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

(define answer (sieve 10001))
;answer
(provide answer)
