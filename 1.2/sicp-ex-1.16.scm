;; Iterative version of fast-expt
(define (fast-expt b n)
	(fast-iter 1 n b))

(define (fast-iter a cnt b)
	(cond ((= cnt 0) a)
				((even? cnt)
				 (fast-iter a (/ cnt 2) (square b)))
				(else (fast-iter (* a b) (- cnt 1) b))))

;; test
(fast-expt 3 8)
(fast-iter 1 4 3)
(fast-iter 1 2 9)
(fast-iter 1 1 81)
(fast-iter 81 0 81) ; => 81
