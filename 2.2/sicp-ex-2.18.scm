;; The following procedure reverse that takes a list 
;; as argument and returns a list of the same elements 
;; in reverse order

(define (my-reverse lst)
  (if (null? lst)
      '()
      (append (my-reverse (cdr lst))
            (list (car lst)))))

(my-reverse (list 1 4 9 16 25))
