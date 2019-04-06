;; The following program performs Miller-Rabin test
;; for primality, base on Fermat little theorem.

;; for more info: http://community.schemewiki.org/?sicp-ex-1.28

(define (Miller-Robin n)
  (define (try-it a)
    (= (mr-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

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
          true))) ;;; which way should I take?
;          (= (remainder (square x) m) 1))))

;; fermat test
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

;; test
(fermat-test 2465)  ; carmichael number
(Miller-Robin 2465) ; carmichael number
(fermat-test 2466)
(Miller-Robin 2466)

;; outputs on my machine

;; 1 ]=> ;; test
;; (fermat-test 2465)
;; ;Value: #t
;; 
;; 1 ]=> ; carmichael number
;; (Miller-Robin 2465)
;; ;Value: #f
;; 
;; 1 ]=> ; carmichael number
;; (fermat-test 2466)
;; ;Value: #f
;; 
;; 1 ]=> (Miller-Robin 2466)
;; ;Value: #f
;; 
;; 1 ]=>
;; End of input stream reached.
;; Fortitudine vincimus.
