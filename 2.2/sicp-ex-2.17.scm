;; The following procedure last-pair that returns the
;; list that contains only the last element of a 
;; given (nonempty) list.

(define (last-pair lst)
  (if (null? (cdr lst))
      (list (car lst))
      (last-pair (cdr lst))))

;; test
(last-pair (list 23 72 149 34))
