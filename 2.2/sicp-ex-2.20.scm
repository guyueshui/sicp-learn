;; The following procedure same-parity that takes one 
;; or more integers and returns a list of all the 
;; arguments that have the same even-odd parity as the 
;; first argument.

(define (same-parity x . z)
  (define (parity? a b)
    (= (remainder a 2) (remainder b 2)))
  (define (helper z ret)
    (cond ((null? z) ret)
          ((parity? x (car z))
           (helper (cdr z) 
                   (append ret (list (car z)))))
          (else
            (helper (cdr z) ret))))
  (helper z (list x)))

;; test
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 83 2 84 20 930 20 934 10 84)
(same-parity 3)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (same-parity 1 2 3 4 5 6 7)
;; ;Value: (1 3 5 7)
;; 
;; 1 ]=> (same-parity 2 83 2 84 20 930 20 934 10 84)
;; ;Value: (2 2 84 20 930 20 934 10 84)
;; 
;; 1 ]=> (same-parity 3)
;; ;Value: (3)
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER
