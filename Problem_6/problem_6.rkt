#lang racket

(define (Ssquares n)
  (/ (* n (+ n 1) (+ (* 2 n) 1)) 6))

(define (squareS n)
  (sqr (/ (* n (+ n 1)) 2)))

(- (squareS 100) (Ssquares 100))