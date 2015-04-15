#lang lazy

(require racket/lazy-require)
(lazy-require [racket/string (string->number string->list)])
(lazy-require [racket/list (range)])

(define (digit-sum num)
  (apply + 
         (map string->number 
              (map string (string->list (number->string num))))))

(define answer 
  (apply max 
         (map (lambda (i) 
                (digit-sum (expt 99 i))) 
              (range 90 100))))

;answer
(provide answer)
