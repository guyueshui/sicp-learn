;; This file together with the following files are comes from
;; a same scenarior of problems. See SICP, Ch. 2.1.4
; add
(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))
; sub
(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (upper-bound y))
                 (- (upper-bound x)
                    (lower-bound y))))
; mult
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
; div
(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                  (/ 1.0 (upper-bound y)) 
                  (/ 1.0 (lower-bound y)))))
; constructor
(define (make-interval a b) (cons a b))
; selectors
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (width x)
  (/ (- (upper-bound x)
        (lower-bound x))
     2.0))
;; consider (a, b) + (c ,d) = (a+c, b+d), it's width is
;; (b + d - a - b) / 2 = width_1 + width_2.
;; while in multiplication, we don't know exactly what's
;; the lb and up of the result interval, so it won't be
;; a function of original widths.

;; test
(define A (make-interval 3 4))
(define B (make-interval -1 5.5))
(define C (add-interval A B))
(define D (mul-interval A B))
(width A)
(width B)
(width C)
(width D)
