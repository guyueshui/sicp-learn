;; The following procedures define the number zero, one, two
;; and procedure add-one, so as the primitive `+`.

; zero
(define zero (lambda (f)
               (lambda (x) x)))

; add-1
(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

; process it generates
(add-1 zero)
(lambda (f)
  (lambda (x) (f ((zero f) x))))
(lambda (f)
  (lambda (x) (f ((lambda (v) v) x))))
(lambda (f)
  (lambda (x) (f x)))

; one
(define one (lambda (f)
              (lambda (x) (f x))))

; process it generates
(add-1 one)
(lambda (f)
  (lambda (x) (f ((one f) x))))
(lambda (f)
  (lambda (x) (f (f x))))

; two
(define two (lambda (f)
              (lambda (x) (f (f x)))))

; process it generates
(add-1 two)
(lambda (f)
  (lambda (x) (f ((two f) x))))
(lambda (f)
  (lambda (x) (f (f (f x)))))

; +
(define (add a b)
  (lambda (f)
    (lambda (x) ((a f) ((b f) x)))))

;; test
(add two one)
(lambda (f)
  (lambda (x)
    ((two f)
     ((one f) x))))
(lambda (f)
  (lambda (x)
    ((lambda (v) (f (f v)))
     (f x)))) ; substitute v to (f x)
(lambda (f)
  (lambda (x)
    (f (f (f x)))))

;; numerical test
((one square) 2) ; (square 2)
((two square) 2) ; (square (square 2))
(((add one two) square) 2) ; (square (square (square 2)))

;; outputs on my machine
;; 
;; 1 ]=> ;; numerical test
;; ((one square) 2)
;; ;Value: 4
;; 
;; 1 ]=> ; (square 2)
;; ((two square) 2)
;; ;Value: 16
;; 
;; 1 ]=> ; (square (square 2))
;; (((add one two) square) 2)
;; ;Value: 256
;; 
;; 1 ]=> ; (square (square (square 2)))
;; End of input stream reached.
;; Fortitudine vincimus.
