# Interpolation

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

Data analysis is crucial in many engineering fields. In order to estimate the value of y at arbitrary points x, which may not be included in the given n+1 data points ($x_{i},y_{i}$) where $i = 1, 2,3,..., n+1$, interpolation is often used.

## Polynomial Interpolation

We can define the global polynimial interpolation problem as follow: given n+1 distinct data points ($x_{i},y_{i}$) where $i = 1, 2,3,..., n+1$, over an interval $[a,b]$ find a degree-n polynomial

$$p_{n}(x) = \sum_{j=0}^na_{j}x^{j}$$

such that 
$$p_{n}(x_i)= y_{i}   \quad\quad i = 1, ..., n+1 $$
the polynimial $p_n$ is called the interpolation points. The points at which the interpolation matches the underlying data are called the interpolant points.

A polynomial interpolant is uniquely characterized by:

1. The polynomial degree n of the interpolant
2. The location of the interpolant points.

## Vandermonde's method

Vandermonde's method is a systematic approach to contruct polynomial interpolants.

### Linear interpolation (n = 1)

The case where we are only given two data points. $(x_{1}, y_{1})$ and $(x_{2},y_{2})$, assuming $(x_{1} \neq x_{2})$. Since there is only 2 data points $(n = 2 - 1 =1)$ we will consider a linear polynomial of the form

$$p_{i} = a_{0} +a_{1}x$$
We will need to identify the unknown $a_{0}$ and $a_{1}$ to find the interpolant. The two interpolant conditions can be expressed as a system of linear equations is the unknown $a_{0}$ and $a_{1}$

$$y_{1} = p_{1}(x_{1}) =  a_{0} +a_{i}x_{1}$$
$$y_{2} = p_{1}(x_{2}) =  a_{0} +a_{i}x_{2}$$

We can re-write this in matrix form:

$$\begin{pmatrix} 1 & x_{1} \\\\ 1 & x_{2}\end{pmatrix}\begin{pmatrix}a_{0}\\\\ a_{1}\end{pmatrix} = \begin{pmatrix} y_{1} \\\\ y_{2}\end{pmatrix}$$

The matrix on the left hand side is called the Vandermonde Matrix. We can see that $(x_{1} \neq x_{2})$  for the rows ( or columns) of the matrix to be linearly independent and the matrix is non-singular. We can then find a unique solution ($a_{0}, a_{1}$). We can then evaluate the interpolant at any arbitrary point x by evaluating $p_{1}(x) = a_{0} + a_{1}x$

Because th matrix is small, we can express an explicit expressions for the linear interpolant:

$$p_{1}(x) = (1- \frac{x-x_{1}}{x_{2} - x_{1}})y_{1} + (\frac{x-x_{1}}{x_{2} - x_{1}})y_{2}$$

We can use the lininter() function in aertoolbox. Here is an example

```
d1 = [0.61, -4.34];
d2 = [2.9, 9.4];
x = 1.54;
[y] = lininter(d1,d2,x);
disp(y)
```

output:

```
 y = 1.2400
```