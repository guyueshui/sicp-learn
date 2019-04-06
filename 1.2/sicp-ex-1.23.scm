;; The following program finds the smallest
;; integral divisor (greater than 1) of 
;; a given number n 
(define (smallest-divisor n)
  (find-divisor n 2))


(define (find-divisor n test-divisor)
  (define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; measuring time
(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime)
                       start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

;; 
(define (search-for-primes start end)
  (cond ((> start end) 'done)
        ((even? start)
         (search-for-primes (+ 1 start) end))
        ((even? end)
         (search-for-primes start (- end 1)))
        (else
          (timed-prime-test start)
          (search-for-primes (+ start 2) end))))

(search-for-primes 1000000000 1000000021)           ; 1e9
(search-for-primes 10000000000 10000000061)         ; 1e10
(search-for-primes 100000000000 100000000057)       ; 1e11
(search-for-primes 10000000000000 10000000000099)   ; 1e12

;; Output on my machine

;; The observed ratio of the speed of the two algorithms
;; is not 2, probably due to NEXT procedure's IF test,
;; this will incur extra cost

;; 1 ]=> (search-for-primes 1000000000 1000000021)
;; 1000000007 *** .02
;; 1000000009 *** 1.9999999999999997e-2
;; 1000000021 *** 2.0000000000000004e-2
;; ;Value: done
;; 
;; 1 ]=> ; 1e9
;; (search-for-primes 10000000000 10000000061)
;; 10000000019 *** .05000000000000002
;; 10000000033 *** .04999999999999999
;; 10000000061 *** .05999999999999997
;; ;Value: done
;; 
;; 1 ]=> ; 1e10
;; (search-for-primes 100000000000 100000000057)
;; 100000000003 *** .18
;; 100000000019 *** .17000000000000004
;; 100000000057 *** .18999999999999995
;; ;Value: done
;; 
;; 1 ]=> ; 1e11
;; (search-for-primes 10000000000000 10000000000099)
;; 10000000000037 *** 1.7199999999999998
;; 10000000000051 *** 1.7000000000000002
;; 10000000000099 *** 1.6900000000000004
;; ;Value: done
;; 
;; 1 ]=> ; 1e12
;; End of input stream reached.
;; Ceterum censeo Carthaginem esse delendam.
