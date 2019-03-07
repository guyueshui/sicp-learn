;; T_pq(a, b) = (bq+aq+ap, bp+aq)
;; T^2_pq(a, b) = T_pq(bq+aq+ap, bp+aq)
;; 	= (-- b(2pq+q^2) + a(2pq+q^2) + a(p^2+q^2),
;; 			b(p^2+q^2) + a(2pq+q^2) --)
;; 
;; ==> view that:
;; 	P = 2pq+q^2
;; 	Q = p^2+q^2

(define (fib n)
	(fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) 
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* 2 p q) (square q))  ;compute p'
                   (+ (square p) (square q))  ;compute q'
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                   p
                   q
                   (- count 1)))))

;; test
(fib 1)
(fib 3)
(fib 5)
(fib 8)
(fib 11)
