; average-damp procedure
(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2.0))
  (lambda (x) (average x (f x))))

; test average-damp
((average-damp square) 10)

; fixed point using average-damp
(define (sqrt x)
  (fixed-point 
    (average-damp
      (lambda (y) (/ x y)))
    1.0))

(define (fixed-point f start)
  (define tol 1e-5)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tol))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try start))

(define (cube-root x)
  (fixed-point
    (average-damp
      (lambda (y)
        (/ x (square y))))
    1.0))

;; test
(sqrt 2)
(cube-root 8)
