; representing vectors in the plane
(define (MAKE-VECTOR x y) (cons x y))
(define (xcor p) (car p))
(define (ycor p) (cdr p))

; representing line segments
(define (make-seg p q) (cons p q))
(define (seg-start s) (car s))
(define (seg-end s) (cdr s))

(define average
  (lambda (x y)
	(/ (+ x y) 2)))

(define (midpoint s)
  (let ((a (seg-start s))
		(b (seg-end s)))
	(MAKE-VECTOR
	  (average (xcor a) (xcor b))
	  (average (ycor a) (ycor b)))))

(define P (MAKE-VECTOR 0 0))
(define Q (MAKE-VECTOR 2 4))
(define S (make-seg P Q))
(define M (midpoint S))
(xcor M)
(ycor M)
