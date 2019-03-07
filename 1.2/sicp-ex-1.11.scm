;; recursive
(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

(f 9)

;; iterative
(define (func n)
    (define (f-iter a b c cnt)
      (if (= cnt n)
          c
          (f-iter (+ a
                     (* 2 b)
                     (* 3 c))
                  a
                  b
                  (1+ cnt))))
    (f-iter 2 1 0 0))

; test iteration
(f 9)
