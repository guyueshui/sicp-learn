;; calculate the given coordinates of pascal's triangle
(define (pascal row col)
    (if (or (= col 1)
            (= col row))
        1
        (+ (pascal (- row 1) (- col 1))
           (pascal (- row 1) col))))

;; test
(pascal 5 3)
