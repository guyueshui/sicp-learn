;; The following procedure accept as one argument
;; a procedure and return a procedure that apply
;; that procedure twice on the given arguments.

(define (double f)
  (lambda (x)
    (f (f x))))

(define inc 1+)

;; test
((double inc) 1)
(((double (double double)) inc) 5)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; ((double inc) 1)
;; ;Value: 3
;; 
;; 1 ]=> (((double (double double)) inc) 5)
;; ;Value: 21
;; 
;; 1 ]=>
;; End of input stream reached.
;; Pulvis et umbra sumus.
