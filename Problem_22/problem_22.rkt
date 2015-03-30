#lang racket

;TODO: lazy require
(require racket/file)

(define names (sort
               (string-split 
                (string-replace 
                 (list-ref 
                  (file->lines "p022_names.txt") 0)  "\"" "") ",") 
               string<?))

(let 
    ([counts (map 
              (lambda (name) 
                (foldl + 0 
                       (map 
                        (lambda (i) (- 
                                     (char->integer (string-ref name i)) 
                                     64)) 
                        (range (string-length name)))))
              names)])
  (foldl + 0 
         (map 
          (lambda (i) (* (+ i 1) (list-ref counts i))) 
          (range (length counts)))))
