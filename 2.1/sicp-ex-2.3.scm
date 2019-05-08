;; The following procedure implements two version of a rectanlge
;; class

;; THE SEGMENT CLASS
; constructor
(define (make-segment s t)
  (cons s t))

; selectors
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

;; THE POINT CLASS
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

;; RECTANGLE
; public method
(define (rect-perimeter rect)
  (* 2 (rect-height rect) (rect-width rect)))
(define (rect-area rect)
  (* (rect-height rect) (rect-width rect)))

;; RECT VER.1
; constructor
(define (make-rect bl tr)
  (cons bl tr))

; selectors
(define (bottom-left rect) (car rect))
(define (top-right rect) (cdr rect))
(define (bottom-right rect)
  (make-point (x-point (top-right rect))
              (y-point (bottom-left rect))))
(define (top-left rect)
  (make-point (x-point (bottom-left rect))
              (y-point (top-right rect))))

(define (rect-height rect) ; height
  (abs (- (y-point (top-right rect))
          (y-point (bottom-left rect)))))
(define (rect-width rect) ; width
  (abs (- (x-point (top-right rect))
       (x-point (bottom-left rect)))))

;; test
(define rect1 (make-rect (make-point 1 2)
                         (make-point 3 4)))
(rect-perimeter rect1)
(rect-area rect1)

;; RECT VER.2
(define (make-rect bl height width)
  (cons bl (cons height width)))

(define (bottom-left rect) (car rect))
(define (rect-height rect) (cadr rect))
(define (rect-width rect) (cddr rect))
(define (bottom-right rect)
  (make-point (+ (x-point (bottom-left rect))
                 (rect-width rect))
              (y-point (bottom-left rect))))
(define (top-left rect)
  (make-point (x-point (bottom-left rect))
              (+ (y-point (bottom-left rect))
                 height)))

;; test
(define rect2
  (make-rect (make-point 1 2)
             2
             3))
(rect-perimeter rect2)
(rect-area rect2)
