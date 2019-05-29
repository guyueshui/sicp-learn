;; rewrite the procedure reverse

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

;;;

; rewrite reverse using fold-right
(define (reverse-r sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              nil
              sequence))
; rewrite reverse using fold-left
(define (reverse-l sequence)
  (fold-left (lambda (x y)
               (cons y x))
             nil sequence))

(reverse-r (list 1 2 3 4 5))
(reverse-l (list 1 2 3 4 5))

;; outputs on my machine
;; 
;; 1 ]=> (reverse-r (list 1 2 3 4 5))
;; ;Value: (5 4 3 2 1)
;; 
;; 1 ]=> (reverse-l (list 1 2 3 4 5))
;; ;Value: (5 4 3 2 1)
;; 
;; 1 ]=>
;; End of input stream reached.
;; Post proelium, praemium.
