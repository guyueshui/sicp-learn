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

;; find a root <==> find a fixed-point of a transform
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

; find the root of g
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

; generate a polynomial of given coeffs
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a (square x))
       (* b x)
       c)))

;; test
(newton-method (cubic 1 2 3) 1.0)
