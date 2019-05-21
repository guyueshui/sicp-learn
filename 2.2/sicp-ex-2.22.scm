
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

(square-list (list 1 2 3 4)) ;]=> (16 9 4 1)

;; The order is reversed since he construct the pair with
;; answer as the second parameter, that will insert something
;; in front of the answer.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(square-list (list 1 2 3 4))
;Value: ((((() . 1) . 4) . 9) . 16)

;; This doesn't work either since he cons a list with a number
;; iteratively, that's not things should be. He should use
;; append instead.
