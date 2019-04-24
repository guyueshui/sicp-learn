;; The following procedure computes the k-term 
;; finite continued fraction.

; iterative
(define (cont-frac n d k)
  (define (frac result cnt)
    (if (= cnt 0)
        result
        (frac (/ (n cnt)
                 (+ (d cnt) result))
              (- cnt 1))))
  (frac 0 k))

; recursive
(define (contfrac n d k)
  (define (frac cnt)
    (if (> cnt k)
        0
        (/ (n cnt)
           (+ (d cnt) (frac (1+ cnt))))))
  (frac 1))

;; test

; find `k` that satisfies the precison
(define (approximation approxmator)
  (define tol 1e-4)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tol))
  (define (update old-approx cnt) 
    (let ((next (approxmator (1+ cnt))))
      (print-line next cnt) ; print the process
      (if (close-enough? old-approx next)
          next
          (update next (1+ cnt)))))
  (update (approxmator 1) 1))

;; KEY POINT: the definition if D
(define (d k)
  (cond ((= (remainder (+ 1 k) 
                       3) 
            0)
         (* 2 (/ (+ k 1)
                 3)
            ))
        (else 1)))

(define (approxmator k)
  (cont-frac (lambda (i) 1.0)
             d
             k))

; print value and count
(define (print-line value cnt)
  (newline)
  (display "--> Step ")
  (display cnt)
  (display ": ")
  (display value))

;; test
(approxmator 10)
(approximation approxmator)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (approxmator 10)
;; ;Value: .7182817182817183
;; 
;; 1 ]=> (approximation approxmator)
;; --> Step 1: .6666666666666666
;; --> Step 2: .75
;; --> Step 3: .7142857142857143
;; --> Step 4: .71875
;; --> Step 5: .717948717948718
;; --> Step 6: .7183098591549296
;; --> Step 7: .7182795698924731
;; ;Value: .7182795698924731
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER
