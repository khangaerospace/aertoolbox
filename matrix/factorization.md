# Linear system

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

We introduce systematic approaches to find the unique solution x to

$$Ax = b$$

where A is an $n\times n$ matrix, b is an $n-$vector. The approaches we consider are categorized as direct methods as they provide the solution in a finite number of steps.

## Forward substitution

We first consider cases where the matrix possesses a special structure which makes the solution of the linear system particularly simple. A matrix L is said to be lower triangular if all the entries above the diagonal are zero. For instance, $3 \times 3 $ lower triangular system is of the form

$$\begin{pmatrix}
l_{11} & 0 & 0 \\\\ l_{21} & l_{22} & 0\\\\l_{31}
& l_{32} & l_{33}
\end{pmatrix} \begin{pmatrix}x_1 \\\\ x_2 \\\\ x_3\end{pmatrix} = \begin{pmatrix}b_1 \\\\ b_2\\\\ b_3\end{pmatrix}$$

L is non-singular if and only if the diagonal entries are non-zero. In this case, we can find the entries of the solution in a sequential manner:

$$x_1 = b_1/l_{11}$$
$$x_2 = (b_2-l_{21}x_1)/l_{22}$$
$$x_3 = (b_3-l_{31}x_1 - l_{32}x_2)/l_{33}$$

This is called forward substitution.

**operation Count**. The inner loop of the forward substitution requires two FLOPs: one for multiplication and one for subtraction. The total FLOP counts for the forward substitution is

$$\sum_{i=1}^n(1+\sum^{i-1}_{j=1}) \equiv n^2$$

## Backward Substitution

We can use a similar technique to solve an upper triangular system. A matrix U is said to be upper triangular if all the entries below the diagonal are zero:

$$\begin{pmatrix}
u_{11} & u_{12} & u_{13} \\\\ 0  & u_{22} & u_{23}\\\\0
& 0 & u_{33}
\end{pmatrix} \begin{pmatrix}x_1 \\\\ x_2 \\\\ x_3\end{pmatrix} = \begin{pmatrix}b_1 \\\\ b_2\\\\ b_3\end{pmatrix}$$

U is non-singular if and only if the diagonal entries are non-zero. In this case, we can find the entries of the solution in a sequential manner:

$$x_3 = b_3/u_{33}$$
$$x_2 = (b_2-u_{23}x_1)/l_{22}$$
$$x_1 = (b_1-l_{12}x_2 - l_{13}x_3)/l_{33}$$

This is called backward substitution.

**operation Count**. The inner loop of the forward substitution requires two FLOPs: one for multiplication and one for subtraction. The total FLOP counts for the forward substitution is

$$\sum_{i=1}^n(1+\sum^{i-1}_{j=1}) \equiv n^2$$

## Appendix

[1] This README.md were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)