;; The following procedure find the fixed point of a given
;; function f.

;;; The golden ratio is the fixed-point of 1 + 1/x.
;;; since we have x = 1 + 1/x
;;; --> x^2 = x + 1, which is the definition of
;;; golden ratio

(define (fixed-point f first-guess)
  (define tol 1e-6)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tol))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; test
(fixed-point cos 1.0)
;; golden ratio
(fixed-point
  (lambda (x) (+ 1 (/ 1 x)))
  1.0)
