;; The first implemention is recursive:
(define (+ a b)
	(if (= a 0)
        b
        (inc (+ (dec a) b))))

(+ 4 5) ; will evolve like the following:
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; While the second implemention is iterative:
(define (+ a b)
	(if (= a 0)
			b
			(+ (dec a) (inc b))))

; now (+ 4 5) will evolve as following:
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
