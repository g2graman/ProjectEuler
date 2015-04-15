#lang lazy

(require racket/lazy-require)
(lazy-require [math (factorize prime?)])
(lazy-require [racket/set (set set-add set-union set->list set-member?)])
(lazy-require [racket/list (range)])

(define cyc-lens (make-hash))
(define inv-cyc-lens (make-hash))

(define primes (set))

(provide cyc-lens inv-cyc-lens primes)

(define (prime-factors n [lst (reverse (factorize n))] [res (set)])
  (if (eq? (length lst) 0)
      res
      (if (> (length lst) 0)
          (prime-factors n (rest lst) (set-add res (first (first lst))))
          0)))

(define (cycle-len-for-comp-denom composite)
  (begin 
    (let ([factors (prime-factors composite)]) 
      (begin 
        (set-union primes factors)
        (apply max 
              (map cycle-len 
                   (set->list factors)))))))
  
(define (cycle-len p [len 1])
  (if (and (not (set-member? primes p)) (not (prime? p)))
      (error "You somehow called cycle-len in isolation with a non-prime")
      (if (or (eq? p 2) (eq? p 5))
          0
          (if (eq? (modulo (- (expt 10 len) 1) p) 0)
              (if (hash-has-key? cyc-lens p)
                  (hash-ref cyc-lens p)
                  (begin
                    (hash-ref! cyc-lens p len)
                    (if (and (hash-has-key? inv-cyc-lens len) (member p (hash-ref inv-cyc-lens len)))
                        (hash-ref cyc-lens p)
                        (if (hash-has-key? inv-cyc-lens len) ; p is not a member of (hash-ref inv-cyc-lens len)
                            (begin 
                              (hash-ref! inv-cyc-lens len 
                                         (append (hash-ref inv-cyc-lens len) (list p))) ; append p to values
                              (hash-ref cyc-lens p))
                            (begin 
                              (hash-ref! inv-cyc-lens len (list p))
                              (hash-ref cyc-lens p))))))
              (cycle-len p (+ len 1))))))

(define (longest-cycle-under [threshold 1000]) 
  (apply max 
         (map (lambda (i) (list-ref (list i (cycle-len-for-comp-denom i)) 1))  (range 2 threshold))))

(define answer 
  (first (hash-ref inv-cyc-lens (longest-cycle-under 1000))))

;answer
(provide answer)
