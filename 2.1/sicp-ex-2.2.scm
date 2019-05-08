;; The following procedure implements a line segment class.

; constructor
(define (make-segment s t)
  (cons s t))

; selectors
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

; define a point class
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; find the mid-point of a line segment
(define (midpoint-segment seg)
  (define (average v1 v2)
    (/ (+ v1 v2)
       2.0))
  (make-point (average (x-point (start-segment seg))
                       (x-point (end-segment seg)))
              (average (y-point (start-segment seg))
                       (y-point (end-segment seg)))))

; utilities
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display " , ")
  (display (y-point p))
  (display ")"))

;; test
(define A (make-point -1 9))
(define B (make-point 3 4))
(define line (make-segment A B))
(define mid (midpoint-segment line))
(print-point mid)
