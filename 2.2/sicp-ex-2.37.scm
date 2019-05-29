;; Matrix arithmetic

(define nil '())
; accumulate
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

; accumulate-n
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;; arithmetics
(define (dot-product v1 v2)
  (accumulate + 0 (map * v1 v2)))

(define (matrix-*-vector m v)
  (map (lambda (vec)
         (dot-product vec v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (vec)
           (matrix-*-vector cols vec)) m)))

;; test
(define mat1 (list (list 1 2 3)
                  (list 4 5 6)))
(define mat2 (list (list 1 1)
                   (list 1 1)
                   (list 1 1)))
(define v1 (list 1 2 3))
(define v2 (list 4 3 2))
(dot-product v1 v2)
(matrix-*-vector mat1 v2)
(transpose mat1)
(matrix-*-matrix mat1 mat2)

;; outputs on my machine
;; 
;; 1 ]=> (dot-product v1 v2)
;; ;Value: 16
;; 
;; 1 ]=> (matrix-*-vector mat1 v2)
;; ;Value: (16 43)
;; 
;; 1 ]=> (transpose mat1)
;; ;Value: ((1 4) (2 5) (3 6))
;; 
;; 1 ]=> (matrix-*-matrix mat1 mat2)
;; ;Value: ((6 6) (15 15))
;; 
;; 1 ]=>
;; End of input stream reached.
;; Fortitudine vincimus.
