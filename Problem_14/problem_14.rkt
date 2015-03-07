#lang racket

(provide seqs)
(define seqs (make-hash))

(define (collatz n [len 0] [start n])
  (if (eq? n 1)
      (list (+ len 1) start)
      (if (eq? (modulo n 2) 1)
          (if (hash-has-key? seqs n)
              (list (hash-ref seqs n) start)
              (begin
                (hash-ref! seqs n (+ (first (collatz (+ (* 3 n) 1) len start)) 1))
                (list (hash-ref seqs n) start)))
          (if (hash-has-key? seqs n)
              (list (hash-ref seqs n) start)
              (begin
                (hash-ref! seqs n (+ (first (collatz (/ n 2) len start)) 1))
                (list (hash-ref seqs n) start))
              ))))

(define max-len 
  (foldl 
   (lambda (a result) (begin (max (first a) result))) 
   0 
   (map collatz (range 1000000 1 (- 1)))))

(car 
 (first
  (filter 
   (lambda (i) 
     (eq? 
      (cdr i)
      max-len)) 
   (hash->list seqs))))