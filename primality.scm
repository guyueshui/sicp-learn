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

;; (smallest-divisor 199)
;; (smallest-divisor 1999)
;; (smallest-divisor 19999)

;; compute the exponential of a number
;; modulo another number
(define (expmod base power m)
  (cond ((= power 0) 1)
        ((even? power)
         (remainder 
           (square (expmod base (/ power 2) m))
           m))
        (else (remainder
                (* base (expmod base (- power 1) m))
                m))))

;; Fermat test
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; (fermat-test 11)

;; The following procedure run `fermat-test`
;; a given times
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((not (fermat-test n)) false)
        (else (fast-prime? n (- times 1)))))

;; test
(fast-prime? 19999 10)
