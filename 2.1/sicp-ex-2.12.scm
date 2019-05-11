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
  (if (or (= (lower-bound y) 0)
          (= (upper-bound y) 0))
      (error "divides by 0!"
             (lower-bound y)
             (upper-bound y))
      (mul-interval x 
                (make-interval 
                  (/ 1.0 (upper-bound y)) 
                  (/ 1.0 (lower-bound y))))))
; constructor
(define (make-interval a b) (cons a b))
; selectors
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

; one more set of constructor / selector
(define (make-center-percent center percent)
  (cons (- center (* center percent))
        (+ center (* center percent))))
(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2.0))
(define (percent i)
  (let ((u (upper-bound i))
        (c (center i)))
    (/ (- u c) (abs c))))

;; test
(define A (make-interval 1 3))
(define B (make-interval -8 2))
(define C (mul-interval A B))
(center B)
(percent B)
