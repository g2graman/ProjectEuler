#lang lazy

(require racket/lazy-require)
(lazy-require [racket/list (range)])

; Note: (eq? (modulo -2 7) 5)
; TODO: generalize
(define answer 
  (foldl + 0 (map 
              (lambda (year) 
                (length (filter (lambda (month) 
                                  (eq? 
                                   (modulo 
                                    (+ 1 
                                       (floor (/ (* 13 (+ month 1)) 5)) 
                                       (modulo year 100)
                                       (floor (/ (modulo year 100) 4))
                                       5
                                       (- 0 (floor (/ year 100)))) 
                                    7)
                                   0)) 
                                (range 3 15)))) 
              (range 1901 2001))))

;answer
(provide answer)
