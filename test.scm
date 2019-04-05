; sum from a to b
(define (sum-int a b)
  (if (> a b)
      0
	  (+ a (sum-int (1+ a) b))))

(sum-int 1 10)


; sum from a^2 to b^2
(define (sum-sq a b)
  (if (> a b)
      0
	  (+ (square a)
		 (sum-sq (1+ a) b))))

(sum-sq 1 10)

; pi sum
(define (pi-sum a b)
  (if (> a b)
	  0
	  (+ (/ 1 (* a (+ a 2)))
		 (pi-sum (+ a 4) b))))

(pi-sum 1 10)

; common pattern
(define (sum term a next b)
  (if (> a b)
	  0
	  (+ (term a)
		 (sum term
			  (next a)
			  next
			  b))))

; redefine sum-int
(define (SUMINT a b)
  (sum 
	(lambda (x) x)
	a
	1+
	b))

(SUMINT 1 10)

; redefine sum-sq
(define (SUMSQ a b)
  (sum
	square
	a
	1+
	b))

(SUMSQ 1 10)

; redefine pi-sum
(define (PISUM a b)
  (sum
	(lambda (x) (/ 1 (* x (+ x 2))))
	a
	(lambda (x) (+ x 4))
	b))

(PISUM 1 10)
