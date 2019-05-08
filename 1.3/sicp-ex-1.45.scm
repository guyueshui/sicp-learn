;; The following procedure find the nth roots
;; using fixed-point search

; find the fixed-point from a start value
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

; average dampling
(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x))
       2.0)))

; repeat a procedure n times 
(define (repeat f n)
  (define (compose f g)
    (lambda (x)
      (f (g x))))
  (cond ((= n 1) f)
        ((even? n)
         (let ((g (repeat f (/ n 2))))
           (compose g g)))
        (else
          (lambda (x)
            (f
              ((repeat f (- n 1)) x))))))
;--- that's all we need ---;

;; testing square root
; not converge
; (define (sqrt x)
;   (fixed-point
;     (lambda (y) (/ x y))
;     1.0))

(define (sqrt x)
  (fixed-point
    (average-damp
      (lambda (y) (/ x y)))
    1.0))

(sqrt 2)

;; testing cube root
; not converge
; (define (cbrt x)
;   (fixed-point
;     (lambda (y) (/ x (square y)))
;     1.0))

(define (cbrt x)
  (fixed-point
    (average-damp
      (lambda (y) (/ x (square y))))
    1.0))

(cbrt 8)

;; testing forth root
(define (forth-root x)
  (fixed-point
    ((repeat average-damp 2)
     (lambda (y) (/ x (cube y))))
    1.0))

(forth-root 16)

;; testing n th root
(define (expo base power)
  (cond ((= power 0) 1)
        ((even? power)
         (square (expo base (/ power 2))))
        (else
          (* base (expo base (- power 1))))))

(define (nth-root x n)
  (fixed-point
    ((repeat average-damp 5)
     (lambda (y) (/ x (expo y (- n 1)))))
    1.0))

(nth-root 100 32)

;; conclusion
;; repeat 1 time will cover 2,3-th root
;; repeat 2 times will cover 4,5,6,7-th root
;; repeat 3 times will cover 8-15 th root
;; repeat 4 times will cover 16-31 th root
;; repeat 5 times will cover 32-63 th root
;; ...
;; to compute the n th root, we need floor(log(n))
;; times `average-damp`s
