;; Redefine count-leaves from 2.2.2 as an accumulation

; accumulator
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

; The idea is change the subtree to subitems of #leaves,
; then add them together.
(define (count-leaves t)
  (accumulate + 0 (map (lambda (st)
                         (if (not (pair? st))
                             1
                             (count-leaves st))) ; wishful thinking
                       t)))

;; test
(define x (cons (list 1 2) (list 3 4)))
(length x)
(count-leaves x)

;; outputs on my machine
;; 
;; 1 ]=> (length x)
;; ;Value: 3
;; 
;; 1 ]=> (count-leaves x)
;; ;Value: 4
;; 
;; 1 ]=>
;; End of input stream reached.
;; Moriturus te saluto.
