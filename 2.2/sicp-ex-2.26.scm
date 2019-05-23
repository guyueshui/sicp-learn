(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
(cons x y) 
(list x y)

;; outputs on my machine
;; 
;; 1 ]=> (append x y)
;; ;Value: (1 2 3 4 5 6)
;; 
;; 1 ]=> (cons x y)
;; ;Value: ((1 2 3) 4 5 6)
;; 
;; 1 ]=> (list x y)
;; ;Value: ((1 2 3) (4 5 6))
;; 
;; 1 ]=>
;; End of input stream reached.
;; Ceterum censeo Carthaginem esse delendam.
