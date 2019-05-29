;; The fold-left procedure.

(define nil '())
; fold-right
(define (fold-right op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (fold-right op initial (cdr seq)))))

; fold-left
(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

;;
(fold-right / 1 (list 1 2 3))
(fold-left  / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left  list nil (list 1 2 3))

;; outputs on my machine
;; 
;; (fold-right / 1 (list 1 2 3))
;; ;Value: 3/2
;; 
;; 1 ]=> (fold-left  / 1 (list 1 2 3))
;; ;Value: 1/6
;; 
;; 1 ]=> (fold-right list nil (list 1 2 3))
;; ;Value: (1 (2 (3 ())))
;; 
;; 1 ]=> (fold-left  list nil (list 1 2 3))
;; ;Value: (((() 1) 2) 3)
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER

;; only if the operator is commutative do fold-left/right
;; produce the same values for any sequence.
(fold-left  + 1 (list 1 2 3)) ;Value: 7
(fold-right + 1 (list 1 2 3)) ;Value: 7
