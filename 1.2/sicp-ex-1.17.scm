;; The problem ask us to write a fast-mult
;; like fast-expt using +, double, halve.
;; The program should evolve O(log n) steps.
(define double
    (lambda (x) (+ x x)))

(define halve
    (lambda (x)
      (if (even? x)
          (/ x 2)
          x)))

(define (fast-mult a b)
    (cond ((= b 0) 0)
          ((even? b) (double (fast-mult a (halve b))))
          (else (+ a (fast-mult a (- b 1))))))

;; test
(fast-mult 3 4)
(double (fast-mult 3 2))
(double (double (fast-mult 3 1)))
(double (double (+ 3 (fast-mult 3 0))))
(double (double 3))
(double 6)
12
