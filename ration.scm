;; (cons x y)
;; 	constructs a pair whose first part
;; 	is x and whose second part is y
;; 
;; (car p)
;; 	selects the first part of the pair p
;; 
;; (cdr p)
;; 	selects the second part of the pair p

; constructor
(define (MAKE-RAT N D)
  (let ((g (gcd N D)))
  (cons (/ N g)
		(/ D g))))

; selector
(define (NUMER R)
  (car R))
(define (DENOM R)
  (cdr R))

; add-operator
(define (+RAT x y)
  (MAKE-RAT
	(+ (* (NUMER x) (DENOM y))
	   (* (NUMER y) (DENOM x)))
	(* (DENOM x) (DENOM y))))

; multiply-operator
(define (*RAT x y)
  (MAKE-RAT
	(* (NUMER x) (NUMER y))
	(* (DENOM x) (DENOM y))))

; test
(define A (MAKE-RAT 1 2))
(define B (MAKE-RAT 1 4))
(define ans (+RAT A B))
(NUMER ans)
(DENOM ans)
