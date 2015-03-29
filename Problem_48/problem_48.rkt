#lang racket

(define (self-powers [cut-off 1000]) 
  (map (lambda (x) (expt x x)) (range 1 (+ cut-off 1))))

(define (answer [digits 10])
  (let ([digs (expt 10 digits)])
    (modulo 
     (foldl 
      (lambda (x res) (+ res (modulo x digs))) 
      0 (self-powers)) 
     digs)))

(answer)