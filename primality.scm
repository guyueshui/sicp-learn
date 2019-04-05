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
