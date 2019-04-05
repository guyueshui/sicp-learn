;; recursive version
(define (fib n)
	(cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2))))))

(fib 6)

;; iterative version
(define (fibo n)
	(define (fib-iter a b cnt)
        (if (= cnt n) ; after n iterations, a=fibo(n), b=fibo(n+1)
            a
            (fib-iter b (+ a b) (1+ cnt))))
	(fib-iter 0 1 0))
;; however if we write fib-iter outside of fibo,
;; we can only pass n to the cnt, see textbook

(fibo 6)
