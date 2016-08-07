#lang racket

(define (factorial n [acc 1])
  (if (= n 1)
      acc
      (factorial (- n 1) (* acc n))))

(define (total-ascii n) (map char->integer (string->list (number->string (factorial n)))))

(define (solve n)
  (letrec ([totalAscii (total-ascii n)]
           [len (length totalAscii)]
           [totalSum (apply + totalAscii)]
           [normalizedSum (- totalSum (* len 48))])
    normalizedSum))

(define answer (solve 100))
(provide answer)
