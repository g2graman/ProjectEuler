#lang racket

(apply + 
       (map 
        (lambda (ch) (string->number (make-string 1 ch))) 
        (string->list 
         (number->string 
          (arithmetic-shift 1 1000)))))
                
                