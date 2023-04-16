# Least Square

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

Least square is a linear system is overdetermined if the number of independent equations is greater than the number of unknowns.  Specifically, a linear system $Ax = b$ associated with the $m × n$ matrix $A$ is overdetermined if the dimension of the image of $A$ is greater than $n$.

For an overdetermined system, we forgo finding x that satisfies $Ax = b$,since it does not exist and instead look for an x that “satisfies the equation as well as possible”. To do this, we first introduce the residual

$$r \equiv Ax-b$$

The residual measures the “misfit” between the left-hand side $Ax$ and the right-hand side $b$. We then seek $x$ which minimizes the residual in some norm. Henceour goal is to find n-vector x such that

$$||r||_2 \equiv ||Ax-b||_2$$

is minimized. Assuming the columns of the matrix $A$ are linearly independent, the solution to the least-squares problem is unique.

## Normal equation

The solution to the least-squares problem satisfies the normal equation,

$$A^TAx = A^Tb$$

If the columns of $A$ are linearly independent, then $A^T A$ is symmetric positive definite, and the
function $r^2(x)$ is convex. Hence, a unique minimum is obtained at $x$ for which $∂r^2/∂x = 0$.  An explicit
expression for the condition

$$\frac{\partial r^2}{\partial x} =2A^TA-2A^Tb = 0$$

Cost of calculating:

Compute $A^TA$  requires a dot product of two m-vectors => 2m operation.

Unforatunatley, solving the normal equation by the normal equation is not most stable.

## Reduced QR factorization

A standard approach to numerically solve least-squares problems is by (reduced) QR factorization. This mean decinpodition of matrix $A$ into $Q$ and $R$ matrix

$$A = QR$$

Matrix $Q$ are othonormal ($Q^TQ =I$) and matrix $R$ is upper triangular. Substitution of QR factorization to the normal equation yields

$$Rx = Q^Tb$$

## Gram-Schmidt procedure

The idea behind the Gram-Schmidt procedure is to successively turn the columns of A into orthonormal vectors.

We can use the ```modified_gram_schmidt()``` algorithm in ACStoolbox

## Appendix

[1] This document were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)