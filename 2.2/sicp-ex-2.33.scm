;; Sequence processing

(define nil '())

; filter elems that satisfies the condition
(define (filter predicate? seq)
  (cond ((null? seq) nil)
        ((predicate? (car seq))
         (cons (car seq)
               (filter predicate? (cdr seq))))
        (else
          (filter predicate? (cdr seq)))))

; accumulator
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

; enumerator
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

;; test
(accumulate + 0 (list 1 2 3 4 5)) ;Value: 15
(accumulate * 1 (list 1 2 3 4 5)) ;Value: 120
(accumulate cons nil (list 1 2 3 4 5))
;Value: (1 2 3 4 5)

(define (fib n)
  (define (fib-iter a b cnt)
    (if (= cnt 0)
        a
        (fib-iter b (+ a b) (- cnt 1))))
  (fib-iter 0 1 n))

(define (list-fib-squares n)
  (accumulate
    cons
    nil
    (map square (map fib (enumerate-interval 0 n)))))

(list-fib-squares 10)
;Value: (0 1 1 4 9 25 64 169 441 1156 3025)

;; Ex 2.33
(define (my-map p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              nil
              sequence))

; this may be confusing, see how accumulate
; and append are defined together.
(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my-length sequence)
  (accumulate (lambda (x y)
                (if (null? x)
                    y
                    (+ 1 y)))
              0
              sequence))

;; test
(my-map square (list 1 2 3 4))
(my-append (list 1 2 3) (list 8 9 10))
(my-length (list 1 2 3 4 5 6))

;; outputs on my mahcine
;; 
;; 1 ]=> ;; test
;; (my-map square (list 1 2 3 4))
;; ;Value: (1 4 9 16)
;; 
;; 1 ]=> (my-append (list 1 2 3) (list 8 9 10))
;; ;Value: (1 2 3 8 9 10)
;; 
;; 1 ]=> (my-length (list 1 2 3 4 5 6))
;; ;Value: 6
;; 
;; 1 ]=>
;; End of input stream reached.
;; Happy happy joy joy!
