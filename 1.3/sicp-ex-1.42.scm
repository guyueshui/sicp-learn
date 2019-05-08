;; The following procedure compose two functions
;; as a composite function

(define (compose f g)
  (lambda (x)
    (f (g x))))

;; test
((compose square 1+) 6)
