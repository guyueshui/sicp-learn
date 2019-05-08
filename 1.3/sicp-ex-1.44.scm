;; The following procedure return a procedure that
;; computes the smoothed version of it's arguments.

(define (smooth f)
  (define dx 1e-5)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeat f n)
  (cond ((= n 1) f)
        ((even? n)
         (let ((g (repeat f (/ n 2))))
           (compose g g)))
        (else
          (lambda (x)
            (f
              ((repeat f (- n 1)) x))))))

; smooth n times
(define (n-fold-smooth n)
  (repeat smooth n))

;; test
((smooth square) 3)
(((n-fold-smooth 2) square) 3)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; ((smooth square) 3)
;; ;Value: 9.000000000066665
;; 
;; 1 ]=> (((n-fold-smooth 2) square) 3)
;; ;Value: 9.000000000133333
;; 
;; 1 ]=>
;; End of input stream reached.
;; Ceterum censeo Carthaginem esse delendam.
