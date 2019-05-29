;; One more abstraction from ex 2.30

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

;; test
(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
;Value: (1 (4 (9 16) 25) (36 49))
