(define (mysqrt x)
  (newton (lambda (y) (- x (square y)))
		  1))

(define (newton f guess)
  (define df (deriv f))
  (fixed-point
	(lambda (x) (- x (/ (f x) (df x))))
	guess))

(define deriv
  (lambda (f)
	(lambda (x)
	  (/ (- (f (+ x dx))
			(f x))
		 dx))))
(define dx 0.0000001)

(define (fixed-point f start)
  (define tol 0.00001)
  (define (close-enuf? u v)
		(< (abs (- u v)) tol))
  (define (iter old new)
		(if (close-enuf? old new)
			new
			(iter new (f new))))
  (iter start (f start)))

(mysqrt 2)
