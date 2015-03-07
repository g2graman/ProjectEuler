#lang racket

(define fibs (make-hash))
(provide fibs)

(define (fib n) 
  (if (<= n 1)
      n
      (if (hash-has-key? fibs n)
          (hash-ref fibs n)
          (begin 
            (hash-ref! fibs n (+ (fib (- n 1)) (fib (- n 2))))
            (hash-ref fibs n)))))

(define (fib-length l [cur 1])
  (if (>= (string-length (number->string (fib cur))) l)
      cur
      (fib-length l (+ cur 1))))