#lang lazy

(define (largest m n [init 999] [cur -1])
  (if (eq? n 0)
      (if (eq? m 0)
          cur
          (if (and (palindrome? (number->string (* m n))) (> (* m n) cur))
              (largest (- m 1) init (* m n))
              (largest (- m 1) init init cur)))
      (if (and (palindrome? (number->string (* m n))) (> (* m n) cur))
          (largest m (- n 1) init (* m n))
          (largest m (- n 1) init cur))))


(define (palindrome? s [b 0] [e (- (string-length s) 1)])
  (if (< (- e b) 2) 
      (if (eq? b e)
          (eq? (string-ref s b) (string-ref s e))
          (if (eq? (- e b) 1)
              (eq? (string-ref s b) (string-ref s e))
              #t)) ; reached the center of odd-length string
      (if (eq? (string-ref s b)
           (string-ref s e))
      (palindrome? s (+ b 1) (- e 1))
      #f)))

(define answer (largest 999 999))
;answer
(provide answer)
