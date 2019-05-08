; fixed-point procedure
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

; calculate derivatives
(define (deriv f)
  (define dx 1e-5)
  (lambda (x)
    (/ (- (f (+ x dx))
          (f x))
       dx)))

; test deriv
(define (cube x) (* x x x))
((deriv cube) 5)

;; find a root <==> find a fixed-point of a transform
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

; find the root of g
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

;; test
(define (sqrt x)
  (newton-method
    (lambda (y)
      (- x (square y)))
    1.0))

(sqrt 2)

;; one more abstraction
(define (fixed-point-of-transform g tranform guess)
  (fixed-point (tranform g) guess))

; half-interval method
(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y) (/ x y))
    average-damp
    1.0))

(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x))
       2.0)))

; or newton-method
(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y)
      (- x (square y)))
    newton-transform
    1.0))

;; test
(sqrt 2)
