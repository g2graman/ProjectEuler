#lang racket

(define triangle (list
                  (list 75)
                  (list 95 64)
                  (list 17 47 82)
                  (list 18 35 87 10)
                  (list 20 04 82 47 65)
                  (list 19 01 23 75 03 34)
                  (list 88 02 77 73 07 63 67)
                  (list 99 65 04 28 06 16 70 92)
                  (list 41 41 26 56 83 40 80 70 33)
                  (list 41 48 72 33 47 32 37 16 94 29)
                  (list 53 71 44 65 25 43 91 52 97 51 14)
                  (list 70 11 33 28 77 73 17 78 39 68 17 57)
                  (list 91 71 52 38 17 14 91 43 58 50 27 29 48)
                  (list 63 66 04 68 89 53 67 30 73 16 69 87 40 31)
                  (list 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)))

(define start (- (length triangle) 2)) ; start from the second last row

(define (solve triangle [i 0][j start])
  (let ([top (list-ref (list-ref triangle 0) 0)])
    (if (< j 0)
        top
        (letrec ([currentRow (list-ref triangle j)]
                 [currentLength (length currentRow)])
          (if (>= i currentLength)
              (solve triangle 0 (- j 1)) ; go up a row
              (solve (add-children triangle i j) (+ i 1) j))))))


(define (add-children triangle i j)
  (list-update triangle j
               (lambda (updateRow)
                  (letrec ([leftChild (list-ref (list-ref triangle (+ j 1)) i)]
                           [rightChild  (list-ref (list-ref triangle (+ j 1)) (+ i 1))]
                           [currentCell (list-ref updateRow i)]
                           [maxChild (max leftChild rightChild)]
                           [newCurrentCell (list (+ currentCell maxChild))]
                           [rowPrefix (take updateRow i)]
                           [rowSuffix (drop updateRow (+ i 1))]
                           [updatedRow (append rowPrefix
                                           newCurrentCell
                                           rowSuffix)])
                    updatedRow))))

(define answer (solve triangle))
(provide answer)
