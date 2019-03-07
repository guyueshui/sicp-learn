;; (cons x y)
;; 	constructs a pair whose first part
;; 	is x and whose second part is y
;; 
;; (car p)
;; 	selects the first part of the pair p
;; 
;; (cdr p)
;; 	selects the second part of the pair p

;; constructor
;(define (MAKE-RAT N D)
;  (let ((g (gcd N D)))
;  (cons (/ N g)
;		(/ D g))))
;
;; selector
;(define (NUMER R)
;  (car R))
;(define (DENOM R)
;  (cdr R))
;
;; add-operator
;(define (+RAT x y)
;  (MAKE-RAT
;	(+ (* (NUMER x) (DENOM y))
;	   (* (NUMER y) (DENOM x)))
;	(* (DENOM x) (DENOM y))))
;
;; multiply-operator
;(define (*RAT x y)
;  (MAKE-RAT
;	(* (NUMER x) (NUMER y))
;	(* (DENOM x) (DENOM y))))
;
;; test
;(define A (MAKE-RAT 1 2))
;(define B (MAKE-RAT 1 4))
;(define ans (+RAT A B))
;(NUMER ans)
;(DENOM ans)

;(define 1-to-4 (list 1 2 3 4))
;(define (scale-list s l)
;	(map (lambda (e) (* s e))
;			 l))
;(scale-list 10 1-to-4)
;(map square 1-to-4)
;(map (lambda (x) (+ x 10)) 1-to-4)
;(for-each display 1-to-4)

;; factorial function: recursive
(define (factorial n)
	(if (= n 1)
			1
			(* n (factorial (- n 1)))))

(factorial 6)

;; factorial function: iterative
(define (fact x)
	(define (fact-iter prod counter x)
		(if (> counter x)
				prod
				(fact-iter 
					(* prod counter)
					(1+ counter)
					x)))
	(fact-iter 1 1 x))

(fact 6)
(define 1000+
	(lambda (x) (+ x 1000)))
(1000+ 999)
