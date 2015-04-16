#lang lazy

(require racket/lazy-require)
(lazy-require [math/bigfloat (bf-precision bigfloat->string bfsqrt bf)])
(lazy-require [racket/list (range)])

(bf-precision 340) ; specific number of bits to accurately get first 100 decimal digits

(define answer 
  (apply 
   + 
   (map 
    (lambda (i) 
      (if (integer? (sqrt i))
          0
          (let ([str (bigfloat->string(bfsqrt (bf i)))])
            (+ (string->number (substring str 0 1))
               (apply + 
                      (map string->number 
                           (map string 
                                (string->list
                                 (substring str 2 (- 102 1))))))))))
    ;TODO: for modularity make above cut from decimal point (generalize the 2)
    (range 2 101))))

;answer
(provide answer)

