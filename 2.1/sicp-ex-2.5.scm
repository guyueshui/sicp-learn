;; The following gives a procedural representation of pairs
;; of non-negative numbers.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (factorial n a b flag)
    (cond ((even? n)
           (factorial (/ n 2) (+ 1 a) b flag))
          ((not (= n 1))
           (factorial (/ n 3) a (+ 1 b) flag))
          ((= n 1)
           (cond ((= flag 0) a)
                 ((= flag 1) b)
                 (else
                   (error "Invalid args!"))))
          (else
            (error "I won't reach here!"))))

(define (car n)
  (factorial n 0 0 0))
(define (cdr n)
  (factorial n 0 0 1))

;; test
(cons 4 5)
(define mycons (cons 4 5))
(car mycons)
(cdr mycons)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (cons 4 5)
;; ;Value: 3888
;; 
;; 1 ]=> (define mycons (cons 4 5))
;; ;Value: mycons
;; 
;; 1 ]=> (car mycons)
;; ;Value: 4
;; 
;; 1 ]=> (cdr mycons)
;; ;Value: 5
;; 
;; 1 ]=>
;; End of input stream reached.
;; Happy happy joy joy!
