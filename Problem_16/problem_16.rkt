#lang lazy

(define answer (apply + 
       (map 
        (lambda (ch) (string->number (make-string 1 ch))) 
        (string->list 
         (number->string 
          (arithmetic-shift 1 1000))))))
;answer
(provide answer)
