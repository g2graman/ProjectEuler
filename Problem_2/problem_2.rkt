#lang lazy

(require racket/lazy-require)
(lazy-require [racket/list (range)])

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

(define (get-answer [i 0] [thresh 4000000] [divisor 2])
  (if (<= (fib i) thresh)
      (answer (+ i 1) thresh)
      (apply + (map 
                (lambda (x)
                  (if (eq? (modulo (fib x) divisor ) 0)
                      (fib x)
                      0)) (range 1 i)))))

(define answer (get-answer))
;answer
(provide answer)
