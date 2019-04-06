;; Using Fermat test to speed up

;; fast prime test algo using fermat test
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

;; the fermat test
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base power m)
  (cond ((= power 0) 1)
        ((even? power)
         (remainder (square (expmod base (/ power 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- power 1) m))
                     m))))

;; measuring time
(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
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
;; Outputs on my machine

;; extremely faster than the previous

;; 1 ]=> (search-for-primes 1000000000 1000000021)
;; 1000000007 *** 0.
;; 1000000009 *** 0.
;; 1000000021 *** 0.
;; ;Value: done
;; 
;; 1 ]=> ; 1e9
;; (search-for-primes 10000000000 10000000061)
;; 10000000019 *** 0.
;; 10000000033 *** 0.
;; 10000000061 *** 0.
;; ;Value: done
;; 
;; 1 ]=> ; 1e10
;; (search-for-primes 100000000000 100000000057)
;; 100000000003 *** 0.
;; 100000000019 *** 0.
;; 100000000057 *** 0.
;; ;Value: done
;; 
;; 1 ]=> ; 1e11
;; (search-for-primes 10000000000000 10000000000099)
;; 10000000000037 *** 0.
;; 10000000000051 *** 0.
;; 10000000000099 *** 0.
;; ;Value: done
;; 
;; 1 ]=> ; 1e12
;; End of input stream reached.
;; Happy happy joy joy!
