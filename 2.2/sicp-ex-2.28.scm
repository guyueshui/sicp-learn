;; The following procedure fringe that takes as argument 
;; a tree (represented as a list) and returns a list whose 
;; elements are all the leaves of the tree arranged in 
;; left-to-right order.

(define (fringe tree)
  (cond ((null? tree) '())
        ((pair? (car tree))
         (append (fringe (car tree))
                 (fringe (cdr tree))))
        (else
          (append (list (car tree))
                  (fringe (cdr tree))))))

;; test
(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))

;; outputs on my machine
;; 
;; 1 ]=> (fringe x)
;; ;Value: (1 2 3 4)
;; 
;; 1 ]=> (fringe (list x x))
;; ;Value: (1 2 3 4 1 2 3 4)
;; 
;; 1 ]=>
;; End of input stream reached.
;; Moriturus te saluto.
