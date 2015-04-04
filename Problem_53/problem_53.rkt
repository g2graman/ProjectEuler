#lang racket

(require racket/lazy-require)
(lazy-require [math (binomial)])

(define (count-comb [n 23] [r 10] [c 0])
  (if (< r n)
      (if (> (binomial n r) 1000000)
          (count-comb n (+ r 1) (+ c 1))
          (count-comb n (+ r 1) c))
      (if (>= n 100)
          c
          (if (> (binomial n r) 1000000)
              (count-comb (+ n 1) 1 (+ c 1))
              (count-comb (+ n 1) 1 c)))))

(count-comb)
