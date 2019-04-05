(define (count-change amount)
	(define (cc amount koc)
		(cond ((= amount 0) 1)
              ((or (< amount 0)
                   (= koc 0))
               0)
              (else (+ (cc amount (- koc 1))
                       (cc (- amount
                              (denomination koc))
                           koc)))))
    (cc amount 5))

(define (denomination koc)
	(cond ((= koc 1) 1)
          ((= koc 2) 5)
          ((= koc 3) 10)
          ((= koc 4) 25)
          ((= koc 5) 50)))

;; please convince yourself the correctness
;; or you can see textbook for more info

(count-change 100)
(count-change 11)
