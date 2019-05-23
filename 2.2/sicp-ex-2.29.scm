;; Mobile stuffs.

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; 1. selectors
(define (left-branch mobi) (car mobi))
(define (right-branch mobi) (cadr mobi))
(define (branch-length brch) (car brch))
(define (branch-structure brch) (cadr brch))

;; test
(define x (make-mobile (make-branch 2 3)
                       (make-branch 2 4)))
(left-branch x) ;]=> (2 3)
(right-branch x) ;]=> (2 4)
(branch-length (left-branch x)) ;]=> 2
(branch-structure (right-branch x)) ;]=> 4

;; 2. total-weight: return the total weight of a mobile
(define (total-weight mobi)
  (cond ((null? mobi) 0)
        ((not (pair? mobi)) mobi)
        (else
          (+ (total-weight (branch-structure (left-branch mobi)))
             (total-weight (branch-structure (right-branch mobi)))))))

;; test
(total-weight x) ;]=> 7

;; 3. balanced?: whether a binary mobile is balanced
(define (balanced? mobi)
  (cond ((null? mobi) #t)
        ((not (pair? mobi)) #t)
        (else
          (let ((lb (left-branch mobi))
                (rb (right-branch mobi)))
            (and (= (torque lb) (torque rb))
                 (balanced? (branch-structure lb))
                 (balanced? (branch-structure rb)))))))

(define (torque brch)
  (* (branch-length brch)
     (total-weight (branch-structure brch))))
;; test
(balanced? x) ; #f

;; 4. Another constructor
(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
  (cons length structure))

; we just need to modify corresponding selectors
(define (left-branch mobi) (car mobi))
(define (right-branch mobi) (cdr mobi))
(define (branch-length brch) (car brch))
(define (branch-structure brch) (cdr brch))

;; test
(define y (make-mobile (make-branch 2 3)
                       (make-branch 2 4)))
y
(left-branch y)
(right-branch y)
(branch-length (left-branch y))
(branch-structure (left-branch y))
(total-weight y)
(balanced? y)

;; outputs on my machine
;; 
;; 1 ]=> y
;; ;Value: ((2 . 3) 2 . 4)
;; 
;; 1 ]=> (left-branch y)
;; ;Value: (2 . 3)
;; 
;; 1 ]=> (right-branch y)
;; ;Value: (2 . 4)
;; 
;; 1 ]=> (branch-length (left-branch y))
;; ;Value: 2
;; 
;; 1 ]=> (branch-structure (left-branch y))
;; ;Value: 3
;; 
;; 1 ]=> (total-weight y)
;; ;Value: 7
;; 
;; 1 ]=> (balanced? y)
;; ;Value: #f
;; 
;; 1 ]=>
;; End of input stream reached.
;; Happy happy joy joy!
