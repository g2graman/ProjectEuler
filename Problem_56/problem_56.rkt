#lang racket

(define (digit-sum num)
  (apply + 
         (map string->number 
              (map string (string->list (number->string num))))))

(define answer 
  (apply max 
         (map (lambda (i) 
                (digit-sum (expt 99 i))) 
              (range 90 100))))

