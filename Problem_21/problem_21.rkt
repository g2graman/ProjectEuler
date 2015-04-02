#lang racket

(require racket/lazy-require)
(lazy-require [math (factorize)])

(define (sum-div p a) ; finds sum of divisors of p^a
  (/ (- (expt p (+ a 1)) 1) (- p 1)))


(define (sum-divs-of n) 
  (- (foldl * 1 (map (lambda (facts) 
         (sum-div 
          (list-ref facts 0) 
          (list-ref facts 1)))  
       (factorize n))) n))

(define answer (foldl + 0 
                      (set->list 
                       (list->set 
                        (append-map 
                         (lambda (x) 
                           (let* ([sdx (sum-divs-of x)]
                                  [sdsdx (sum-divs-of sdx)])
                             (if (and (not (eq? sdx x)) (eq? sdsdx x))
                                 (list x sdx)
                                 (list))))
                         (range 2 10000))))))

answer

;Note: by this definition (eq? 1 (sum-divs-of (sum-divs-of 1))), so initialize range from 2
