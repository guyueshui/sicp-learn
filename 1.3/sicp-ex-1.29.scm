;; The following procedure calculates the integral
;; of a function using Simpson's Rule.

; Preliminaries
; general sum
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; ; simple integral
;; (define (integral f a b dx)
;;   (define (term v)
;;     (f (+ v (/ dx 2.0))))
;;   (define (next v)
;;     (+ v dx))
;;   (* (sum term a next b) dx))
;; 
;; ; or use lambda expression
;; (define (integral f a b dx)
;;   (* (sum
;;        (lambda (v) (f (+ v (/ dx 2.0))))
;;        a
;;        (lambda (v) (+ v dx))
;;        b)
;;      dx))

; or the origin ver. from textbook
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))


; Simpson's Rule for integral
(define (simpson-int f a b n)
  ; first get `h`
  (define h (/ (- b a)
               n))
  ; slightly modified general sum
  (define (sum term next a b cnt)
    (if (> a b)
        0
        (+ (term a cnt)
           (sum term next (next a) b (+ cnt 1)))))
  ; top-down implementions
  (define (term a cnt)
    (* (coeff cnt)
       (f a)))
  (define (coeff cnt)
    (cond ((= cnt 0) 1)
          ((= cnt n) 1)
          ((even? cnt) 2)
          (else 4)))
  (define (next a)
    (+ a h))
  ; result
  (* (/ h 3.0)
     (sum term next a b 0)))

;; test
(define (cube x)
  (* x x x))
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(simpson-int cube 0 1 100)
(simpson-int cube 0 1 1000)

;; outputs on my machine
;; 
;; 1 ]=> (integral cube 0 1 0.01)
;; ;Value: .24998750000000042
;; 
;; 1 ]=> (integral cube 0 1 0.001)
;; ;Value: .249999875000001
;; 
;; 1 ]=> (simpson-int cube 0 1 100)
;; ;Value: .25
;; 
;; 1 ]=> (simpson-int cube 0 1 1000)
;; ;Value: .25
;; 
;; 1 ]=>
;; End of input stream reached.
;; ..#]^@^@^@ NO CARRIER
