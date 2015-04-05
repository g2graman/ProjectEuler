#lang racket

(define fibs (make-hash))

(define triples (make-hash))
(define inv-triples (make-hash))

(provide fibs triples inv-triples)

(define (fib n) 
  (if (<= n 2)
      (- n 1)
      (if (hash-has-key? fibs n)
          (hash-ref fibs n)
          (begin 
            (hash-ref! fibs n (+ (fib (- n 1)) (fib (- n 2))))
            (hash-ref fibs n)))))

(define (pythag [a 4] [b 3] [cur 4])
  (let ([c (sqrt (+ (sqr a) (sqr b)))])
    (if (eq? cur 4)
      (list (+ a b c) 
            (- (fib (- (* 2 (+ cur 1)) 1)) b))
      (if (hash-has-key? triples (+ cur 1))
          (hash-ref triples (+ cur 1))
          (begin 
            (hash-ref! triples (+ cur 1)
                       (list (+ a b c) 
                             (- (fib (- (* 2 (+ cur 1)) 1)) b)))
            (hash-ref! inv-triples (list (+ a b c) 
                                         (- (fib (- (* 2 (+ cur 1)) 1)) b)) cur)
            (hash-ref triples (+ cur 1)))))))

(define (stop-over-s s [a 12] [b 5] [cur 4])
  (letrec ([vals (pythag a b cur)]
           [na (first vals)]
           [nb (first (rest vals))]
           [c (sqrt (+ (sqr a) (sqr b)))]
           [nc (sqrt (+ (sqr na) (sqr nb)))])
    (if (>= (+ na nb nc) s)
        (list na nb nc)
        (stop-over-s s na nb (+ cur 1)))))

(hash-ref! triples 5 (list 30 16))

