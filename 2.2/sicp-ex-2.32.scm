;; The following procedure generates the set of subsets 
;; of a set.

(define nil '())
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (set)
                       (append (list (car s)) set))
                     rest)))))

;; test
(subsets (list 1 2 3))
;Value: (() (3) #0=(2) #1=(2 3) (1) (1 3) (1 . #0#) (1 . #1#))

;; It should be correct, but the output seems incorrect.
;; The subsets of a set can be divided into two groups:
;;     1. Subsets that contain the a specific elem (say (car s))
;;     2. Subsets that doesn't contain the specific elem
;; So, at first time, I take one elem 'e' from the set, gives 
;; a rest. Once we get all subsets of the rest, then we append
;; 'e' to those subsets to get another group of subsets.
;; And the two groups of subsets combining together is just
;; all subsets of the origin set.
