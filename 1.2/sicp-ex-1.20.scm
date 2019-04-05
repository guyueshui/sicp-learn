;; Use normal order evaluation,
;; special form `if` will first evaluate
;; the predicate, which determines the
;; consequence next evaluated

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; evolve at normal-order evaluation
;; #of `remainder` ]=> 21
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40)
     (remainder 40 
                (remainder 206 40)))
(gcd (remainder 40 
                (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40
                           (remainder 206 40))))
(gcd (remainder (remainder 206 40)
                (remainder 40
                           (remainder 206 40)))
     (remainder (remainder 40
                           (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40
                                      (remainder 206 40)))))
(gcd (remainder 6
                (remainder 40 6))
     (remainder (remainder 40 6)
                (remainder 6
                           (remainder 40 6))))
(gcd (remainder 6 4)
     (remainder 4
                (remainder 6 4)))
(gcd 2
     (remainder 4 2))
(gcd 2 0) ;]=> 2

;; evolve at applicative-order evaluation
;; #of `remainder` ]=> 4
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 6 (remainder 40 6))
(gcd 4 (remainder 6 4))
(gcd 2 (remainder 4 2))
(gcd 2 0) ;]=> 2

