#lang racket

(define 
  (completes? n [cur_x 0] [cur_y 0])
  (if (and (eq? cur_x (- n 1)) (eq? cur_y (- n 1)))
      #t
      #f))

(define (complete n [cur_x 0] [cur_y 0])
  (if (completes? n cur_x cur_y)
      1
      (if (or (> cur_x (- n 1)) 
              (> cur_y (- n 1)))
          0
          (+ (complete n (+ cur_x 1) cur_y) 
             (complete n cur_x (+ cur_y 1))))))

(define (num-paths n) 
  (complete (+ n 1)))