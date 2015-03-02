#lang racket

(define (fib n [cur 0] [next 1]) 
  (if (eq? n 0)
      cur
      (fib (- n 1) next (+ cur next))))

(define (answer [i 0] [thresh 4000000] [divisor 2])
  (if (<= (fib i) thresh)
      (answer (+ i 1) thresh)
      (apply + (map 
                (lambda (x)
                  (if (eq? (modulo (fib x) divisor ) 0)
                      (fib x)
                      0)) (range 1 i)))
      )
  )