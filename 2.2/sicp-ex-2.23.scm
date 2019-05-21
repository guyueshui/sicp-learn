;; The following procedure gives a possible implemention of
;; `for-each`.

(define l (list 1 2 3 4))
(map square l) ;]=> (1 4 9 16)
(for-each (lambda (x) (display (square x))) l) ; 14916]=> Unspecified return value

;; As we see, `for-each` just apply, doesn't return anything.

(define (my-for-each f lst)
  (cond ((not (null? lst))
         (f (car lst))
         (my-for-each f (cdr lst)))))

;; test
(for-each
  (lambda (x) (newline) (display (square x)))
  l)

(my-for-each
  (lambda (x) (newline) (display (square x)))
  l)

;; outputs on my machine
;; 
;; 1 ]=> (for-each
;;   (lambda (x) (newline) (display (square x)))
;;     l)
;; 1
;; 4
;; 9
;; 16
;; ;Unspecified return value
;; 
;; 1 ]=> (my-for-each
;;   (lambda (x) (newline) (display (square x)))
;;     l)
;; 1
;; 4
;; 9
;; 16
;; ;Unspecified return value
;; 
;; 1 ]=>
;; End of input stream reached.
;; Post proelium, praemium.
