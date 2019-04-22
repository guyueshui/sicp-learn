;; The following procedure performs a iterative ver.
;; of the "general sum" procedure from textbook.

; recursive
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; iterative
(define (itersum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ result (term a)))))
  (iter a 0))

;; test
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (itersum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))

;; outputs on my machine
;; 
;; 1 ]=> (* 8 (pi-sum 1 1000))
;; ;Value: 3.139592655589782
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER
