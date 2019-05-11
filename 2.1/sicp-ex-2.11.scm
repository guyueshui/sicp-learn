;; Infact I don't quite get the meaning of this problem.
;; The answer is refered to
;; http://community.schemewiki.org/?sicp-ex-2.11

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
; (define (mul-interval x y)
;   (let ((p1 (* (lower-bound x)
;                (lower-bound y)))
;         (p2 (* (lower-bound x)
;                (upper-bound y)))
;         (p3 (* (upper-bound x)
;                (lower-bound y)))
;         (p4 (* (upper-bound x)
;                (upper-bound y))))
;     (make-interval (min p1 p2 p3 p4)
;                    (max p1 p2 p3 p4))))

; improved mult
(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (let ((x-pos (> x1 0))
          (x-neg (< x2 0))
          (y-pos (> y1 0))
          (y-neg (< y2 0)))
      (cond (x-pos
              (cond (y-pos (make-interval (* x1 y1) (* x2 y2)))
                    (y-neg (make-interval (* x2 y1) (* x1 y2)))
                    (else (make-interval (* x2 y1) (* x2 y2)))))
            (x-neg
              (cond (y-pos (make-interval (* x1 y2) (* x2 y1)))
                    (y-neg (make-interval (* x2 y2) (* x1 y1)))
                    (else (make-interval (* x1 y2) (* x1 y1)))))
            (else
              (cond (y-pos (make-interval (* x1 y2) (* x2 y2)))
                    (y-neg (make-interval (* x2 y1) (* x1 y1)))
                    (else (make-interval (min (* x1 y2) (* x2 y1))
                                         (max (* x1 y1) (* x2 y2))))))))))

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

;; test
(define A (make-interval -1 3))
(define B (make-interval -8 2))
(define C (mul-interval A B))
(cdr C)
