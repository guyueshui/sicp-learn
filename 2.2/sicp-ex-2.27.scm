;; The deep-reverse procedure takes a list as argument 
;; and returns as its value the list with its elements 
;; reversed and with all sublists deep-reversed as well.

(define (my-reverse lst)
  (if (null? lst)
      '()
      (append (my-reverse (cdr lst))
            (list (car lst)))))

(define x (list (list 1 2) (list 3 4)))
(my-reverse x) ;]=> ((3 4) (1 2))

(define (deep-reverse lst)
  (cond ((null? lst) '())
        ((pair? (car lst))
         (append (deep-reverse (cdr lst))
                 (list (my-reverse (car lst)))))
        (else
          (append (deep-reverse (cdr lst))
                  (list (car lst))))))

(deep-reverse x)

;; outputs on my machine
;; 
;; 1 ]=> (deep-reverse x)
;; ;Value: ((4 3) (2 1))
;; 
;; 1 ]=>
;; End of input stream reached.
;; Happy happy joy joy!
