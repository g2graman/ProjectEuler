#lang lazy

(require racket/lazy-require)
(lazy-require [math (factorize)])
(lazy-require [racket/set (set set-member? set-add)])
(lazy-require [racket/list (range)])

(define (sum-div p a) ; finds sum of divisors of p^a
  (/ (- (expt p (+ a 1)) 1) (- p 1)))


(define (sum-divs-of n) 
  (- (foldl * 1 (map (lambda (facts) 
         (sum-div 
          (list-ref facts 0) 
          (list-ref facts 1)))  
       (factorize n))) n))

(define (chain-length n [cur (sum-divs-of n)] [acc 1] [vs (set)])
  (if (eq? cur n)
      acc
      (if (or (> cur (expt 10 6)) (and (not (eq? n cur)) (set-member? vs cur))) ; detect cycles or if in excess of 1000000
          0
          (chain-length n (sum-divs-of cur) (+ acc 1) (set-add vs cur)))))

(define lengths (map chain-length (range 10000 14500 2)))

(define answer (+ 
 (* 
  (- 
   (length lengths) 
   (length 
    (member 
     (foldl max 0 
            (filter (lambda (x) (> x 0)) lengths)) 
     lengths))) 
  2) 
 10000))
 ;answer
 (provide answer)
