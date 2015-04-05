#lang racket

(require math)

(provide hash)
(define hash (make-hash))

(define (include elem key)
  (hash-set! hash key elem))

(define (choose n k)
  (if (or (eq? k 0) (eq? n k))
      1 ; result is 1, no need to cache
      (if (eq? k 1)
          n ; result is n, no need to cache
          (if (and (>= (- n k ) 0 ) (< (- n k) k))
              (if (hash-has-key? hash (cons n (- n k))) 
                  (hash-ref hash (cons n (- n k)))
                  (begin
                    (include (choose n (- n k)) (cons n (- n k)))
                    (include (choose n (- n k)) (cons n k))
                    (hash-ref hash (cons n (- n k)))))
              (if (hash-has-key? hash (cons (- n 1) (- k 1)))
                  (if (hash-has-key? hash (cons (- n 1) k))
                      (+ (hash-ref hash (cons (- n 1) (- k 1))) (hash-ref hash (cons (- n 1) k)))
                      (begin
                        (include (choose (- n 1) k) (cons (- n 1) k))
                        (+ (hash-ref hash (cons (- n 1) (- k 1))) (hash-ref hash (cons (- n 1) k)))))
                  (if (hash-has-key? hash (cons (- n 1) k))
                      (begin
                        (include (* (/ n k) (choose (- n 1) (- k 1))) (cons n k))
                        (+ (hash-ref hash (cons (- n 1) (- k 1))) (hash-ref hash (cons (- n 1) k))))
                      (begin
                        (include (* (/ n k) (choose (- n 1) (- k 1))) (cons n k))
                         (hash-ref hash (cons n k)))))))))

(apply + 
       (map 
        (lambda (factor) 
          (* (first factor) (first (rest factor)))) (factorize (choose 20000000 15000000))))