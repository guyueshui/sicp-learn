;; 

(define (f g) (g 2))

;; test
(f square)
(f (lambda (z) (* z (+ z 1))))

;;
(f f)
; using substitue model
; (f 2)
; (2 2) -> 2 is not applicable
