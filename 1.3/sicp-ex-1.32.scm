;; The following `accumulate` procedure is a more
;; general abstraction of "general sum" and
;; "general product".

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;; test
(sum (lambda (x) x)
     1 1+ 10)
(product (lambda (x) x)
         1 1+ 10)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (sum (lambda (x) x)
;;      1 1+ 10)
;; ;Value: 55
;; 
;; 1 ]=> (product (lambda (x) x)
;;                1 1+ 10)
;; ;Value: 3628800
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER

;; Gee, it's really amazing!
