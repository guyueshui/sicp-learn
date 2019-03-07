;(define (mysqrt x)
;  (define tol 0.00001)
;  (define (good-enuf? y)
;	(< (abs (- (square y) x)) tol))
;  (define (improve y)
;	(average (/ x y) y))
;  (define (average a b) (/ (+ a b) 2))
;  (define (try y)
;	(if (good-enuf? y)
;		y
;		(try (improve y))))
;  (try 1))
;
;(mysqrt 2)
;
;; find common pattern
;(define (MYSQRT x)
;  (fixed-point
;	(lambda (y) (average (/ x y) y))
;	1))
;
(define average
  (lambda (x y) (/ (+ x y) 2)))

(define (fixed-point f start)
  (define tol 0.00001)
  (define (close-enuf? u v)
	(< (abs (- u v)) tol))
  (define (iter old new)
	(if (close-enuf? old new)
		new
		(iter new (f new))))
  (iter start (f start)))
;
;(MYSQRT 2)

; one more time rewrite
(define (mysqrt x)
  (fixed-point
	(average-damp (lambda (y) (/ x y)))
	1))

(define average-damp
  (lambda (f)
	(lambda (var) (average (f var) var))))

(mysqrt 2)
