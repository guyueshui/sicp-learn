(define A (list 1 3 (list 5 7) 9))
(define B (list (list 7)))
(define C (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

;; The key difference between (1 2 3 4) and (1 (2 (3 4))):
;; (1 2 3 4)
;;    +---+---+  +---+---+  +---+---+  +---+---+
;;    | * | *-+->| * | *-+->| * | *-+->| * | / |
;;    +-+-+---+  +-+-+---+  +-+-+---+  +-+-+---+
;;      |          |          |          |   
;;      V          V          V          V  
;;    +---+      +---+      +---+      +---+
;;    | 1 |      | 2 |      | 3 |      | 4 |
;;    +---+      +---+      +---+      +---+
;;
;; while (1 (2 (3 4))))
;;    +---+---+  +---+---+
;;    | * | *-+->| * | / |
;;    +-+-+---+  +-+-+---+
;;      |          |   
;;      V          V      
;;    +---+      +---+---+  +---+---+
;;    | 1 |      | * | *-+->| * | / |
;;    +---+      +-+-+---+  +---+---+
;;                 |          |
;;                 V          V
;;               +---+      +---+---+  +---+---+
;;               | 2 |      | * | *-+->| * | / |
;;               +---+      +-+-+---+  +-+-+---+
;;                            |          |
;;                            V          V
;;                          +---+      +---+
;;                          | 3 |      | 4 |
;;                          +---+      +---+

;; quite confusing
(car (cdaddr A)) 
; the final car (on the left) is needed to pull
; the 7 from the (cons 7 nil) list
(caar B)
(cadadr (cadadr (cadadr C)))

;; outputs on my machine
;; 
;; 1 ]=> (car (cdaddr A))
;; ;Value: 7
;; 
;; 1 ]=> (caar B)
;; ;Value: 7
;; 
;; 1 ]=> (cadadr (cadadr (cadadr C)))
;; ;Value: 7
;; 
;; 1 ]=>
;; End of input stream reached.
;; Pulvis et umbra sumus.
