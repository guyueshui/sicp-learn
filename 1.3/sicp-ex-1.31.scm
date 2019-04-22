;; The following procedure is a general product like
;; the general sum from textbook.

;; (1)

; recursive
(define (product term next a b)
  (if (> a b)
      1
      (* (term a)
         (product term next (next a) b))))

;; (2)

; iterative
(define (iter-product term next a b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

; define `factorial` using `product`
(define (factorial n)
  (iter-product 
    (lambda (x) x)
    (lambda (x) (+ x 1))
    1
    n))

;; test
(factorial 4)

;;     2 4 4 6 6 8          2 2 4 4 6 6 8
;; x = ----------- => 2x =  -------------
;;     3 3 5 5 7 7          3 3 5 5 7 7

(define (pi-approx n)
  (define (term v) (square v))
  (define (next v) (+ v 2))
  (define prod (/ (iter-product term next 2 n)
                  (iter-product term next 3 (+ 1 n))))
  (* 2.0 (* prod (+ n 2))))

;; test
(pi-approx 10000)

;; outpus on my machine
;; 
;; 1 ]=> ;; test
;; (pi-approx 10000)
;; ;Value: 3.1417497057380523
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER
