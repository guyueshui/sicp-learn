;; Just the iterative ver. of ex-1.17
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
    (define (iter cum a b)
      (cond ((= b 0) cum)
            ((even? b) (iter cum
                             (double a)
                             (halve b)))
            (else (iter (+ cum a)
                        a
                        (- b 1)))))
    (iter 0 a b))

;; test

(* 3 4)
(* 4 0)
(* 5 7)
