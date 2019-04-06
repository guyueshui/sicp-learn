;; The following procdure find the Carmichael numbers
;; less than n.

(define (carmichael? n)
  (carmi-iter n 0))

(define (expmod base power m)
  (cond ((= power 0) 1)
        ((even? power)
         (remainder (square (expmod base (/ power 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- power 1) m))
                     m))))

(define (carmi-iter n a)
  (define (pass-test a)
    (= (expmod a n n) a))
  (cond ((>= a n) true)
        ((pass-test a)
         (carmi-iter n (+ a 1)))
        (else false)))

;; test
(carmichael? 30)
(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)

;; outputs on my machine

;; 1 ]=> ;; test
;; (carmichael? 30)
;; ;Value: #f
;; 
;; 1 ]=> (carmichael? 561)
;; ;Value: #t
;; 
;; 1 ]=> (carmichael? 1105)
;; ;Value: #t
;; 
;; 1 ]=> (carmichael? 1729)
;; ;Value: #t
;; 
;; 1 ]=> (carmichael? 2465)
;; ;Value: #t
;; 
;; 1 ]=> (carmichael? 2821)
;; ;Value: #t
;; 
;; 1 ]=> (carmichael? 6601)
;; ;Value: #t
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER
