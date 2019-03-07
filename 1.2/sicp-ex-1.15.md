```scheme
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
	(if (not (> (abs angle) 0.1))
		angle
		(p (sine (/ angle 3.0)))))
```

## Q1

since `12.15 / (3^5) = 0.05 < 0.1`, which means `p` will be applied 5 times.

## Q2

Given a, the base case is `a/(3^n) = 0.1`, which leads `n = log3(10a)`, so the maximal depth of the recursion tree is `log3(10a)`. So the order of growth is `log(a)` in both space and time.
