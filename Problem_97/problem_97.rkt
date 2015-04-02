#lang racket

(modulo 
 (+ 
  (* 28433 
     (modulo (expt 2 7830457) (expt 10 10))) 
  1) 
 (expt 10 10))