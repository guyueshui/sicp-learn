;; The following procedure is a general numerical method
;; that covers fixed-point, etc.

; iteratively imporve a guess until it is good enough.
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve)
         (improve guess)))))

; two helpers
(define (average x y)
  (/ (+ x y)
     2.0))

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 1e-5))

; rewrite fixed-point
(define (fixed-point f start)
  ((iterative-improve 
     (lambda (x) (close-enough? x (f x)))
     f)
   start))

; rewrite sqrt, using half-interval method
; so far we have learned >=3 ways to compute sqrt:
;   1. half-interval method
;   2. fixed-point method
;   3. newton method
(define (sqrt x)
  ((iterative-improve
     (lambda (v) (close-enough? (square v) x))
     (lambda (v) (average v (/ x v))))
   1.0))

;; test
(fixed-point cos 1.0)
(sqrt 9)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (fixed-point cos 1.0)
;; ;Value: .7390893414033927
;; 
;; 1 ]=> (sqrt 9)
;; ;Value: 3.000000001396984
;; 
;; 1 ]=>
;; End of input stream reached.
;; Moriturus te saluto.
