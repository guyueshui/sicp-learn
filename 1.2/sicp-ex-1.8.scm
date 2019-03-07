; use the update rule from textbook
(define (cube-root x)
    (fixed-point (lambda (y)
                   (/ (+ (/ x (square y))
                         (* 2 y))
                      3))
                 1.0))

; solve the fixed point
(define (fixed-point f start)
	(define (iter old new)
      (if (close-enuf? old new)
          new
          (iter new (f new))))
	(define (close-enuf? a b)
		(< (abs (- a b)) 0.001))
	(iter start (f start)))

(cube-root 27)
