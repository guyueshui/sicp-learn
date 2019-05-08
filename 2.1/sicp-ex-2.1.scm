;; The following procedure define a better `make-rat` interms of
;; dealing with signs.

; arithmetic operations
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; constructors
(define (make-rat n d)
  (cons n d))

; selectors
(define (numer x) (car x))
(define (denom x) (cdr x))

; utilities
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;; improve make-rat
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (> (* n d) 0)
        (cons (abs (/ n g))
              (abs (/ d g)))
        (cons (- (abs (/ n g)))
              (abs (/ d g))))))

;; test
(define a (make-rat -1 -3))
(define b (make-rat 1 -3))
(print-rat a)
(print-rat b)
(print-rat (add-rat a b))
