#lang lazy

(require racket/lazy-require)
(lazy-require [math (next-prime prime?)])

(define (get-prime n)
  (- (hash-ref prime-sum (+ n 1))
     (hash-ref prime-sum n)))

(define prime-sum 
(let () 
	(define init (make-hash))
	(hash-ref! init 1 2)
	(hash-ref! init 0 0)
	init))
  
  (define
  (sums [from-prime 2] [from 3] [to 999983] [last 2]) ; TODO: reduce to relevant primes
  (let ([next-prime (next-prime from)]
        [next (+ from-prime 1)])
    (if (eq? from to)
        (hash-ref! prime-sum from-prime 
                   (+ from (hash-ref prime-sum (- from-prime 1))))
        (begin
          (hash-ref! prime-sum from-prime 
                     (+ from (hash-ref prime-sum (- from-prime 1))))
            (sums next next-prime to from)))))
            
  (define (thresh-prime) (apply max (hash-keys prime-sum)))

(define (get-answer [seq-size 550] [cur (thresh-prime)]) ; seq-size can default to anything as high as (thresh-prime), used as an upper bound
  (if (eq? seq-size 21)
      (void)
      (if (eq? cur seq-size)
          (answer (- seq-size 1))
          (let ([potential (- (hash-ref prime-sum cur) 
                              (hash-ref prime-sum (- cur seq-size)))])
            (if (and (prime? potential) (< potential 1000000))
                potential
                (answer seq-size (- cur 1)))))))
  
  
  (define answer 
  (begin 
	(sums)
	(get-answer)))
  ;answer
  (provide answer)



