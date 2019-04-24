;; The following procedure computes the k-term 
;; tan-cf approximation of tan.

(define (tan-cf x k)
  (define (n k)
    (if (= k 1)
        x
        (square x)))
  (define (d k) (- (* 2 k)
                   1))
  (cont-frac n d k))

(define (cont-frac n d k)
  (define (frac cnt)
    (if (> cnt k)
        0
        (/ (n cnt)
           (- (d cnt) 
              (frac (1+ cnt))))))
  (frac 1))

;; test
(tan (/ 3.14 4))
(tan-cf (/ 3.14 4) 10)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (tan (/ 3.14 4))
;; ;Value: .9992039901050427
;; 
;; 1 ]=> (tan-cf (/ 3.14 4) 10)
;; ;Value: .9992039901050428
;; 
;; 1 ]=>
;; End of input stream reached.
;; Post proelium, praemium.
