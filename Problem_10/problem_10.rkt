#lang racket

(require math)
(+ (apply + (filter prime? (range 1 2000001 2))) 2)