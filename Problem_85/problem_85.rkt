#lang racket

(define (answer 
         [num-recs 2000000] 
         [x 2000] 
         [y 1]
         [e num-recs]
         [cur 0])
  (letrec 
      ([rects (arithmetic-shift  (* x (+ x 1) y (+ y 1)) -2)]
       [new-e (abs (- rects num-recs))])
    (if (< x y)
       cur
        (if  (> e new-e)
             (if (> rects num-recs)
                 (answer num-recs (- x 1) y new-e (* x y))
                 (answer num-recs x (+ y 1) new-e (* x y)))
             (if (> rects num-recs)
                 (answer num-recs (- x 1) y e cur)
                 (answer num-recs x (+ y 1) e cur))))))


;(define start-time (current-inexact-milliseconds)) ;for profiling
(answer)
;(define time-total (- (current-inexact-milliseconds) start-time))
;time-total
