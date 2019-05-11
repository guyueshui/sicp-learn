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

;; Small percentage tolerance -> p < 1
;; All numbers are positive
;; a: [Ca(1-Pa), Ca(1+Pa)]
;; b: [Cb(1-Pb), Cb(1+Pb)]
;; a * b = [Ca*Cb*(1-Pa-Pb+Pa*Pb), Ca*Cb(1+Pa+Pb+Pa*Pb)]
(define (mul-interval-ws a b)
  (let ((Ca (center a))
        (Pa (percent a))
        (Cb (center b))
        (Pb (percent b)))
    (make-interval (* Ca Cb (+ 1 (- Pa)
                               (- Pb) (* Pa Pb)))
                   (* Ca Cb (+ 1 Pa Pb (* Pa Pb))))))

; helpers
(define (print-interval i)
  (newline)
  (display "(")
  (display (lower-bound i))
  (display ", ")
  (display (upper-bound i))
  (display ")"))

;; test
(define A (make-interval 2 8))
(define B (make-interval 2 8))
(print-interval A)
(print-interval B)
(print-interval (div-interval A A))
(print-interval (div-interval A B))

;; Refer to
;;     http://wiki.drewhess.com/wiki/SICP_exercise_2.16
;; Lem is right, cause in the interval arithmetic system 
;; we've defined, some of the laws of algebra that we're 
;; accustomed to don't apply to certain operations, 
;; so algebraic expressions that are equivalent in a 
;; non-interval arithmetic system are not necessarily 
;; equivalent in an interval arithmetic system.
;; 
;; For example a(b+c) = ab+ac, this is not ture in interval
;; arithmetic. Consider
(define a (make-interval 2 4))
(define b (make-interval -2 0))
(define c (make-interval 3 8))
(define x (mul-interval a
                        (add-interval b c)))
(define y (add-interval (mul-interval a b)
                        (mul-interval a c)))
(print-interval x) ; ]=> (2, 32)
(print-interval y) ; ]=> (-2, 32)
;; Furthermore, we know that A/A should be 1, but our interval
;; arithmetic doesn't recognize this. It will produce an interval
;; instead, this introduce uncertainty, even though it shouldn't.
;; 
;; so in ex 2.15, Eva is right, since `par1` will reintroduce
;; uncertainty since it use twice of `r1` and `r2` while `par2`
;; uses the trick interval (1, 1) to avoid reintroduce uncertainty.
;; 
;; ex 2.16, it is currently in research, since the equivalence of
;; our intuition fails in the interval arithmetic defined above.
