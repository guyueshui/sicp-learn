;; Using fast-exp, you will have to compute large
;; exponentials, while use original, we every time
;; take the mod of exponential by m, the benefit
;; is we only need to handle some small numeric computations

(define (square x)
  (display "square ")
  (display x)
  (newline)
  (* x x))

;; original way to compute expmod
(define (expmod base power m)
  (cond ((= power 0) 1)
        ((even? power)
         (remainder (square (expmod base (/ power 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- power 1) m))
                     m))))

;; use fast-exp to compute expmod
(define (fast-exp base power)
  (cond ((= power 0) 1)
        ((even? power)
         (square (fast-exp base (/ power 2))))
        (else
          (* base (fast-exp base (- power 1))))))

(define (expmod2 base power m)
  (remainder (fast-exp base power) m))

;; test
(expmod 5 101 101)
(expmod2 5 101 101)

;; output on my machine

;; 1 ]=> ;; test
;; (expmod 5 101 101)square 5
;; square 24
;; square 71
;; square 92
;; square 1
;; square 1
;; ;Value: 5
;; 
;; 1 ]=> (expmod2 5 101 101)square 5
;; square 125
;; square 15625
;; square 244140625
;; square 298023223876953125
;; square 88817841970012523233890533447265625
;; ;Value: 5
;; 
;; 1 ]=>
;; End of input stream reached.
;; Post proelium, praemium.
