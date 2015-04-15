#lang lazy

(require racket/lazy-require)
(lazy-require [math (prime?)])
(lazy-require [racket/list (range)])

; TODO: patch with earlier implementation of prime sieve
(define answer (+ (apply + (filter prime? (range 1 2000001 2))) 2))
;answer
(provide answer)
