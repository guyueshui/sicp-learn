;; The following program finds the smallest
;; integral divisor (greater than 1) of 
;; a given number n 
(define (smallest-divisor n)
  (find-divisor n 2))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

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
;; sqrt(10) ~= 3.16, roughly meets the description

;; 1 ]=> (search-for-primes 1000000000 1000000021)
;; 1000000007 *** 3.0000000000000002e-2
;; 1000000009 *** 2.0000000000000004e-2
;; 1000000021 *** .03
;; ;Value: done
;; 
;; 1 ]=> ; 1e9
;; (search-for-primes 10000000000 10000000061)
;; 10000000019 *** .07
;; 10000000033 *** .07999999999999999
;; 10000000061 *** .07
;; ;Value: done
;; 
;; 1 ]=> ; 1e10
;; (search-for-primes 100000000000 100000000057)
;; 100000000003 *** .24
;; 100000000019 *** .22999999999999998
;; 100000000057 *** .23999999999999988
;; ;Value: done
;; 
;; 1 ]=> ; 1e11
;; (search-for-primes 10000000000000 10000000000063)
;; 10000000000037 *** 2.3200000000000003
;; 10000000000051 *** 2.3100000000000005
;; ;Value: done
;; 
;; 1 ]=> ; 1e12
;; End of input stream reached.
;; Happy happy joy joy!
