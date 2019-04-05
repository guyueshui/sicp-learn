; recursive
(define (expo b n)
	(if (= n 0)
        1
        (* b (expo b (- n 1)))))

; iterative
(define (expon b n)
	(define (exp-iter prod cnt)
		(if (= cnt n)
            prod
            (exp-iter (* b prod) (+ cnt 1))))
    (exp-iter 1 0))

;; test
(expo 3 4)
(expon 3 4)

;; a fast version
(define (fast-exp b n)
	(cond ((= n 0) 1)
          ((even? n)
           (square (fast-exp b (/ n 2))))
          (else (* b (fast-exp b (- n 1))))))

;; test
(fast-exp 3 4)
