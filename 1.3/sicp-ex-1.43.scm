;; The following procedure apply a procedure n times,
;; and return a procedure.

(define (compose f g)
  (lambda (x)
    (f (g x))))

; w.o. using compose
(define (repeated f n)
  (lambda (x)
    (if (= n 1)
        (f x)
        (f 
          ((repeated f (- n 1)) x)))))

; w. using compose
(define (repeat f n)
  (cond ((= n 1) f)
        ((even? n)
         (let ((g (repeat f (/ n 2))))
           (compose g g)))
        (else
          (lambda (x)
            (f
              ((repeat f (- n 1)) x))))))

;; test
((repeated square 2) 5)
((repeat square 2) 5)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; ((repeated square 2) 5)
;; ;Value: 625
;; 
;; 1 ]=> ((repeat square 2) 5)
;; ;Value: 625
;; 
;; 1 ]=>
;; End of input stream reached.
;; Ceterum censeo Carthaginem esse delendam.
