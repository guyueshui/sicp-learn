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

(define (approxmator k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

; print value and count
(define (print-line value cnt)
  (newline)
  (display "--> Step ")
  (display cnt)
  (display ": ")
  (display value))

;; now the test
(approxmator 10)
(approximation approxmator)

;; outputs on my machine
;; 
;; 1 ]=> ;; now the test
;; (approxmator 10)
;; ;Value: .6179775280898876
;; 
;; 1 ]=> (approximation approxmator)
;; --> Step 1: .5
;; --> Step 2: .6666666666666666
;; --> Step 3: .6000000000000001
;; --> Step 4: .625
;; --> Step 5: .6153846153846154
;; --> Step 6: .6190476190476191
;; --> Step 7: .6176470588235294
;; --> Step 8: .6181818181818182
;; --> Step 9: .6179775280898876
;; --> Step 10: .6180555555555556
;; ;Value: .6180555555555556
;; 
;; 1 ]=>
;; End of input stream reached.
;; Pulvis et umbra sumus.
