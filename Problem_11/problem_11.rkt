#lang racket

;TODO: generalize to (n x n) or (n x m)

(define rows (make-hash))
(provide rows)

(define (diag-lr-windows len)
  (filter (lambda (elem) (not (eq? elem (void)))) 
          (append-map 
           (lambda (offset) 
             (map 
              (lambda (row)
                (if (and (>= (- 21 offset) len) (>= (- 21 row) len))
                    (cut-diagonal-lr row offset len)
                    (void)))
              (range 1 21))) 
           (range 1 21))))

(define (diag-rl-windows len)
  (filter (lambda (elem) (not (eq? elem (void)))) 
          (append-map 
           (lambda (offset) 
             (map 
              (lambda (row)
                (if (and (>= (- 21 row) len) (>= offset len) (<= offset 20))
                    (cut-diagonal-rl row offset len)
                    (void)))
              (range 1 21))) 
           (range 1 21))))

(define (row-windows len)
  (append-map 
   (lambda (offset) 
     (map 
      (lambda (row) 
        (cut-row (+ row 1) (+ offset 1) len)) 
      (range 20))) 
   (range (- 20 len))))

(define (col-windows len)
  (append-map 
   (lambda (offset) 
     (map 
      (lambda (row)
        (cut-col offset row len)) 
      (range 1 21))) 
   (range 1 (+ (- 20 len) 1))))

(define (cut-row i start len)
  (take (drop (hash-ref rows i) (- start 1)) len))

(define (cut-col i start len) ; i == starting row, start == offset from left in row
  (append-map 
      (lambda (l) 
        (cut-row (+ i l) start 1))
      (range len)))

(define (cut-diagonal-lr i start len) ; from top left to bottom right
     (append-map 
      (lambda (l) 
        (cut-row (+ i l) (+ start l) 1))
      (range len)))

(define (cut-diagonal-rl i start len) ; from top right to bottom left
     (append-map 
      (lambda (l) 
        (cut-row (+ i l) (- start l) 1))
      (range len)))

(define (maximizeAdjOnOp len op)
  (apply max 
         (map (lambda (f) (apply max 
                                 (map 
                                  (lambda (group) (apply op group)) 
                                  (f len)))) 
              (list col-windows row-windows diag-rl-windows diag-lr-windows))
         )
  )

(let ()
  ;initialize grid
  (hash-ref! rows 1 (list 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08))
  (hash-ref! rows 2 (list 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00))
  (hash-ref! rows 3 (list 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65))
  (hash-ref! rows 4 (list 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91))
  (hash-ref! rows 5 (list 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80))
  (hash-ref! rows 6 (list 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50))
  (hash-ref! rows 7 (list 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70))
  (hash-ref! rows 8 (list 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21))
  (hash-ref! rows 9 (list 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72))
  (hash-ref! rows 10 (list 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95))
  (hash-ref! rows 11 (list 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92))
  (hash-ref! rows 12 (list 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57))
  (hash-ref! rows 13 (list 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58))
  (hash-ref! rows 14 (list 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40))
  (hash-ref! rows 15 (list 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66))
  (hash-ref! rows 16 (list 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69))
  (hash-ref! rows 17 (list 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36))
  (hash-ref! rows 18 (list 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16))
  (hash-ref! rows 19 (list 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54))
  (hash-ref! rows 20 (list 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48))
  
  (define len 4)
  
  (maximizeAdjOnOp len *))