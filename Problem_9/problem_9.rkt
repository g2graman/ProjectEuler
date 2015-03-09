#lang racket

(define triples (make-hash))
(provide triples)

(define (pythag [n 1] [m 1])
  (let ([a (- (sqr n) (sqr m))]
        [b (* 2 m n)]
        [c (+ (sqr n) (sqr m))])
    (begin 
      (hash-ref! triples (cons n m) (list a b c))
      (list a b c))))


(define (stop-over-s s [n 1] [m 1])
  (letrec ([vals (pythag n m)]
           [a (list-ref vals 0)]
           [b (list-ref vals 1)]
           [c (list-ref vals 2)])
    (if (>= (+ a b c) s)
        (if (and (eq? (+ a b c) s)
                 (eq? (length (filter positive? vals)) (length vals)))
            (* a b c)
            (if (> 
                 (let ([tr (pythag (+ n 1) 1)])
                   (apply + (map  (lambda (i) (list-ref tr i)) (range (length tr)))))
                 s)
                (void)
                (stop-over-s s (+ n 1) 1)))
        (stop-over-s s n (+ m 1)))))