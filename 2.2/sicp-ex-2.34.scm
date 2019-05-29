;; The following procedure horner-eval evaluates a polynomial 
;; using Horner’s rule. Assume that the coefficients of the 
;; polynomial are arranged in a sequence, from a0 through an.

; accumulator
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (horner-eval x coeff-seq)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* higher-terms x)))
              0
              coeff-seq))

;; test
; evaluate 1 + 3x + 5x^3 + x^5 at x=2
(horner-eval 2 (list 1 3 0 5 0 1))
;Value: 79
