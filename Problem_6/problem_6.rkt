#lang lazy

(require racket/lazy-require)
(lazy-require [math (sqr)])

(define (Ssquares n)
  (/ (* n (+ n 1) (+ (* 2 n) 1)) 6))

(define (squareS n)
  (sqr (/ (* n (+ n 1)) 2)))

(define answer (- (squareS 100) (Ssquares 100)))
;answer
(provide answer)
