;; fill the blank

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-m items)
  (map square items))

(square-list (list 1 2 3 4))
(square-list-m (list 1 2 3 4))
