;; The following procedure find the fixed point of a given
;; function f. But it can print the converge process.

; find fixed point
(define (fixed-point f first-guess)
  (define tol 1e-6)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tol))
  (define (try guess cnt)
    (let ((next (f guess)))
      (print-line next cnt)
      (if (close-enough? guess next)
          next
          (try next (1+ cnt)))))
  (try first-guess 0))

; print value and count
(define (print-line value cnt)
  (display "--> Step ")
  (display cnt)
  (display ": ")
  (display value)
  (newline))

;; test
(fixed-point
  (lambda (x) (/ (log 1000) (log x)))
  2.71828)

; if use average dampling
(define (average x y)
  (/ (+ x y) 2.0))

(fixed-point 
  (lambda (x) (average x
                       (/ (log 1000) (log x))))
  2.71828)

;; outputs on my machine
;; 
;; 1 ]=> ;; test
;; (fixed-point
;;     (lambda (x) (/ (log 1000) (log x)))
;;     2.71828)
;; --> Step 0: 6.9077599255056255
;; --> Step 1: 3.574248672572249
;; --> Step 2: 5.423142848848506
;; --> Step 3: 4.085796028270493
;; --> Step 4: 4.9077612294397035
;; --> Step 5: 4.342266567047013
;; --> Step 6: 4.704284882542387
;; --> Step 7: 4.461008904677125
;; --> Step 8: 4.619413524706869
;; --> Step 9: 4.5140827540990385
;; --> Step 10: 4.583164850235612
;; --> Step 11: 4.53744198314647
;; --> Step 12: 4.567523399243504
;; --> Step 13: 4.5476540879202005
;; --> Step 14: 4.56074393393097
;; --> Step 15: 4.552105522227964
;; --> Step 16: 4.557799823660396
;; --> Step 17: 4.554043421239284
;; --> Step 18: 4.5565202125600575
;; --> Step 19: 4.554886603607411
;; --> Step 20: 4.555963846313773
;; --> Step 21: 4.555253384881196
;; --> Step 22: 4.555721903553597
;; --> Step 23: 4.55541291667136
;; --> Step 24: 4.5556166844660675
;; --> Step 25: 4.555482301977737
;; --> Step 26: 4.555570924099178
;; --> Step 27: 4.555512479193301
;; --> Step 28: 4.555551022400475
;; --> Step 29: 4.5555256038234075
;; --> Step 30: 4.555542366878409
;; --> Step 31: 4.555531311946762
;; --> Step 32: 4.5555386024636855
;; --> Step 33: 4.555533794501987
;; --> Step 34: 4.555536965262213
;; --> Step 35: 4.555534874204665
;; --> Step 36: 4.555536253217948
;; --> Step 37: 4.555535343784355
;; ;Value: 4.555535343784355
;; 
;; 1 ]=> ; if use average dampling
;; (define (average x y)
;;     (/ (+ x y) 2.0))
;; ;Value: average
;; 
;; 1 ]=> 
;; (fixed-point
;;   (lambda (x) (average x
;;                        (/ (log 1000) (log x))))
;;   2.71828)
;; --> Step 0: 4.813019962752813
;; --> Step 1: 4.604577354717796
;; --> Step 2: 4.56408471277804
;; --> Step 3: 4.556997373139955
;; --> Step 4: 4.555784747035329
;; --> Step 5: 4.555578112096927
;; --> Step 6: 4.55554292551675
;; --> Step 7: 4.555536934526627
;; --> Step 8: 4.555535914500412
;; --> Step 9: 4.555535740831309
;; ;Value: 4.555535740831309
;; 
;; 1 ]=>
;; End of input stream reached.
;; Ceterum censeo Carthaginem esse delendam.
