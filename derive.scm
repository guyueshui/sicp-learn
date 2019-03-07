(define (deriv EXP VAR)
	(cond ((constant? EXP VAR) 0)
				((same-var? EXP VAR) 1)
				((sum? EXP)
				 (make-sum (deriv (A1 EXP) VAR)
									 (deriv (A2 EXP) VAR)))
				((prod? EXP)
				 (make-sum
					 (make-prod (M1 EXP)
											(deriv (M2 EXP) VAR))
					 (make-prod (deriv (M1 EXP) VAR)
											(M2 EXP))))))

(define (constant? EXP VAR)
	(and (atom? EXP)
			 (not (eq? EXP VAR))))

(define (same-var? EXP VAR)
	(and (atom? EXP)
			 (eq? EXP VAR)))

(define (sum? EXP)
	(and (not (atom? EXP))
			 (eq? (car EXP) '+)))

(define (make-sum a1 a2)
	(list '+ a1 a2))

(define A1 cadr)
(define A2 caddr)

(define (prod? EXP)
	(and (not (atom? EXP))
			 (eq? (car EXP) '*)))

(define (make-prod m1 m2)
	(list '* m1 m2))

(define M1 cadr)
(define M2 caddr)

(define atom?
	(lambda (x)
		(not (pair? x))))

;; test
(define foo
	'(+ (* a (* x x))
			(* b x)
			c))

(deriv foo 'x)

