;; The following `filtered-accumulate` is one step more
;; general form fo `accumulate`!

(define (filtered-accumulate combiner
                             null-value
                             term
                             next
                             a
                             b
                             predicate?)
  (if (> a b)
      null-value
      (if (predicate? a)
          ; cons
          (combiner (term a)
                    (filtered-accumulate combiner
                                         null-value
                                         term
                                         next
                                         (next a)
                                         b
                                         predicate?))
          ; alt
          (filtered-accumulate combiner
                               null-value
                               term
                               next
                               (next a)
                               b
                               predicate?))))

;; modules required
;;; [module] prime test
(define (prime? n)
  (mr-test n 10))

(define (mr-test n times)
  (cond ((= times 0) true)
        ((Miller-Robin n)
         (mr-test n (- times 1)))
        (else false)))

(define (Miller-Robin n)
  (define (try-it a)
    (= (mr-expmod a (- n 1) n) 1))
  (if (= n 1)
      true
      (try-it (+ 1 (random (- n 1))))))

(define (mr-expmod base power m)
  (cond ((= power 0) 1)
        ((even? power)
         (let ((x (mr-expmod base (/ power 2) m)))
           (if (non-trivial-sqrt? x m)
               0
               (remainder (square x) m))))
        (else
          (remainder (* base (mr-expmod base (- power 1) m))
                     m))))

(define (non-trivial-sqrt? x m)
  (cond ((= x 1) false)
        ((= x (- m 1)) false)
        (else
;          true))) ;;; which way should I take?
          (= (remainder (square x) m) 1))))

;; (1)
(define (sum-prime a b)
  (filtered-accumulate + 0 square 1+ a b prime?))

; test
(prime? 1)
(prime? 2)
(prime? 3)
(prime? 5)
(prime? 7)
(sum-prime 1 10)

;; (2)
;;; [module] GCD
(define (relative-prime? p n)
  (= (gcd n p) 1))

(define (product-rp n)
  (define (rp-to-n? x)
    (relative-prime? x n))
  (filtered-accumulate * 1
                       (lambda (x) x)
                       1+ 1 n rp-to-n?))

;; test
(product-rp 10)

;; outputs on my machine
;; 
;; 1 ]=> ; test
;; (prime? 1)
;; ;Value: #t
;; 
;; 1 ]=> (prime? 2)
;; ;Value: #t
;; 
;; 1 ]=> (prime? 3)
;; ;Value: #t
;; 
;; 1 ]=> (prime? 5)
;; ;Value: #t
;; 
;; 1 ]=> (prime? 7)
;; ;Value: #t
;; 
;; 1 ]=> (sum-prime 1 10)
;; ;Value: 88
;; 
;; 1 ]=> ;; (2)
;; ;;; [module] GCD
;; (define (relative-prime? p n)
;;     (= (gcd n p) 1))
;; ;Value: relative-prime?
;; 
;; 1 ]=> (define (product-rp n)
;;   (define (rp-to-n? x)
;;         (relative-prime? x n))
;;     (filtered-accumulate * 1
;;                          (lambda (x) x)
;;                          1+ 1 n rp-to-n?))
;; ;Value: product-rp
;; 
;; 1 ]=> ;; test
;; (product-rp 10)
;; ;Value: 189
;; 
;; 1 ]=>
;; End of input stream reached.
;; Happy happy joy joy!

;;; Incredible! Amazing! WTF!
