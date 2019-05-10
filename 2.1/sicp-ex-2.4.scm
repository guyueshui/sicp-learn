;; The following gives one more procedural representation of
;; pairs.

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;; use substitution model
(car z)
(car (cons x y))
(car (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
; substitute `m` to (lambda (p q) p)
((lambda (p q) p) x y)
x

(cdr z)
(z (lambda (p q) q))
((lambda (m) (m x y)) (lambda (p q) q))
((lambda (p q) q) x y)
y
