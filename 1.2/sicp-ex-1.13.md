First we see that some of fibonacci numbers:

0, 1, 1, 2, 3, 5, 8, 13, 21...

and so the induction base holds since:
$$
\begin{gathered}
Fib(0) = 0 = \frac{\phi^0 - \psi^0}{\sqrt{5}} \newline
Fib(1) = 1 = \frac{\phi - \psi}{\sqrt{5}}
\end{gathered}
$$

Now the induction hypothesis gives us:
$$
\begin{gathered}
Fib(n) = \frac{\phi^n - \psi^n}{\sqrt{5}} \newline
Fib(n+1) = \frac{\phi^{n+1} - \psi^{n+1}}{\sqrt{5}}
\end{gathered}
$$

Notice that $\phi$ is so called golden ratio, and both $\phi$ and $\psi$ are roots of
$$
x^2 - x - 1 = 0.
$$
Thus, by the induction hypothesis,
$$
\begin{split}
Fib(n+2) &= Fib(n+1) + Fib(n) \newline
&= \frac{\phi^{n+1} - \psi^{n+1}}{\sqrt{5}}
+
\frac{\phi^n - \psi^n}{\sqrt{5}} \newline
&= \frac{(\phi+1)\phi^n - (\psi+1)\psi^n}{\sqrt{5}} \newline
&= \frac{\phi^{n+2} - \psi^{n+2}}{\sqrt{5}}
\end{split}
$$
which concludes the induction.

Now the conclusion gives us
$$
Fib(n) - \frac{\phi^n}{\sqrt{5}} = \frac{\psi^n}{\sqrt{5}}
$$
moreover, we know
$$
\begin{gathered}
|\psi| = \frac{|1- \sqrt{5}|}{2} < 1 \newline
\implies |\psi^n| < 1 < \frac{\sqrt{5}}{2} \newline
\implies \frac{|\psi^n|}{\sqrt{5}} < \frac{1}{2} \newline
\lvert Fib(n) - \frac{\phi^n}{\sqrt{5}}\vert < \frac{1}{2}
\end{gathered}
$$
which implies that Fib(n) is the closet integer to $\phi^n/\sqrt{5}$.