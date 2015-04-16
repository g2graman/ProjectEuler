#lang lazy

(define (get-answer [num-digs 10]) 
  (let ([trim (expt 10 num-digs)])
    (modulo 
     (+ (* 28433 (modulo (arithmetic-shift 1 7830457) trim)) 1) 
     trim)))

(define answer (get-answer))
;answer
(provide answer)
