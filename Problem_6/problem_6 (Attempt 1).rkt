#lang racket

(define Ssquares 
  (apply + 
         (map sqr (range 1 101))))

(define squareS
  (sqr (apply + (range 1 101))))

(- squareS Ssquares)