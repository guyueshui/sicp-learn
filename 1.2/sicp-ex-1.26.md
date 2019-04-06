The benefit to use
```scheme
(square (expmod base (/ exp 2) m))
```
is that we can memorize the result of
```scheme
(expmod base (/ exp 2) m)
```
so that we only compute it once.
Note that compute this is very expensive.
If using Louis's modification, one will introduce
the entire tree recursion whose execution time grows
exponentially with the depth of the tree, which is
`log(n)`. So the time complexity will be `O(n)`.
