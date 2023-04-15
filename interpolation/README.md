# Interpolation

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

Data analysis is crucial in many engineering fields. In order to estimate the value of y at arbitrary points x, which may not be included in the given n+1 data points ($x_{i},y_{i}$) where $i = 1, 2,3,..., n+1$, interpolation is often used.

[Polynomial Interpolation](#polynomial-interpolation)

[Piecewise Polynomial Interpolation](#piecewise-polynomial-interpolation)
## Polynomial Interpolation

We can define the global polynimial interpolation problem as follow: given n+1 distinct data points ($x_{i},y_{i}$) where $i = 1, 2,3,..., n+1$, over an interval $[a,b]$ find a degree-n polynomial

$$p_{n}(x) = \sum_{j=0}^na_{j}x^{j}$$

such that 
$$p_{n}(x_i)= y_{i}   \quad\quad i = 1, ..., n+1 $$
the polynimial $p_n$ is called the interpolation points. The points at which the interpolation matches the underlying data are called the interpolant points.

A polynomial interpolant is uniquely characterized by:

1. The polynomial degree n of the interpolant
2. The location of the interpolant points.

### Vandermonde's method

Vandermonde's method is a systematic approach to contruct polynomial interpolants.

#### Linear interpolation (n = 1)

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

We can use the [lininter()](https://github.com/khangaerospace/aertoolbox/blob/main/interpolation/lininter.m) function in aertoolbox. Here is an example

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

#### General Case
We now consider the general case with n+1 data points ($x_{i},y_{i}$) where $i = 1, 2,3,..., n+1$ the interpolant points are distinct. We consider an interpolant of the form

$$p_{n}(x)= a_{0} + a_{1}x+...+a_{n}x^{n} = \sum_{j=0}^{n} a_{j}x^{j} \quad i = 1, ..., n+1 $$

WE impose the interpolation conditions in the matrix form:

$$\begin{pmatrix} 1 & x_{1} & ... & x_{1}^n \\\\ . &.\\\\ . &&.\\\\. &&&.\\\\ 1 & x_{n+1} & ... &x_{n+1}^{n}\end{pmatrix}\begin{pmatrix}a_{0}\\\\ a_{1} \\\\.\\\\.\\\\a_{n}\end{pmatrix} = \begin{pmatrix} y_{1} \\\\ y_{2} \\\\.\\\\.\\\\ y_{n+1} \end{pmatrix}$$

We can see n+1 distrinct interpolation points, the rows ( or columns) of the matrix are linearly independent and the matrix is non-singular. We can find the unique solution of this linear system and the associated interpolant. 

##### Cost
- $O(n^3)$: To  contruct the Vandermonde's Matrix
- $O(n)$: to evaluate each terms and sum them together.

##### Conditioning:
The Vandermonde's approach is a systematic approcach to contruct a degree n polynomial interpolant associated with n+1 data points. For n+1 distinct interpolation points, the solution is unique (at least in exact arithmetic). But in particularly for large n, the column become linearly dependent and the system become ill-conditioned. 

we can use the ```function(TODO)``` in aertoolox

Example:
```
TODO
```
Output:
```
TODO
```

Readmore about ill-conditioning

### Lagrange Basis Polynomials

To overcome ill-conditioning and reduce the computational cost, we can consider a different contruction of Lagrange basis polynomials.

Lagrange basis polynomials associated with n+1 interpolation points $x_i$, $i = 1,2, ... , n+1$. It's a ser of n+1 degree polynomials $l_{j}$ where $j = 1,2, ... , n+1$ with the property

$$l_{j}(x) = \begin{cases} 1, i=j \\\\0, i \neq j\end{cases}$$

For each j, the n+1 constrains define a unique degree n polynomial. The explicit form is:

$$l_{j}(x) = \prod_{0<k<n+1} \frac{x-x_{k}}{x_{j}-x_{k}} \quad j = 1, ..., n+1 $$

We can contruct the interpolant for data points ($x_{i},y_{i}$):

$$p_{n}(x) = \sum_{k = 0}^{n} y_{k}l_{k}(x)$$

For a given degree n and data points ($x_{i},y_{i}$) $i = 1, 2,3,..., n+1$, the polynomialinterpolant construction using the Lagrange basis polynomials is identical to the contructed using the Vandermonde method. 

#### Cost
 
 $O(n):$ computation of Lagrange basis at a point require 2n substraction and n divisions

 $O(n^2)$: We repeat the above procedure n + 1 times.

We can use ```function()``` to  contruction of Lagrange basis polynomials.

Example:
```
```
Output:
```
```
### Error analysis

There are a few approach to construct and evaluate polynomial interpolants.

**Theorem:** Suppose the polynomial interpolant $p_{n}$ interpolates a smooth function $f$ at interpolation points $a = x_{1} < x_{2} < ... < x_{n+1} < b$ . Then the error in the polynomial interpolant is bounded from above by.

$$|f(x)-p_{n}(x)| = \frac{1}{(n+1)!}\max_{s∈[a,b]}|f^{(n+1)}(s)|(b-a)^{n+1} \quad ∀x∈[a,b]$$

Key observation:
1. The interpolation error depends on the n+1 derivative of the underlying function $f^{(n+1)}$. The smaller the n+1 derivative, the more accurate the interpolant. 
2. The interpolation error depends on the degree n of the interpolant. If $|f^{(n+1)}|$ grow slower than $(n+1)!$, then the interpolation error decreases exponentially with n.
3. A special case, if the underlying function is a polynomial of degree $m \leq n$, then the interpolation error is zero everywhere.

Read more about [Runge's phenomena](https://github.com/khangaerospace/aertoolbox/blob/main/interpolation/RungePhenomena.md).

### Chebyshev nodes

One approach to overcome Runge's Phenomena is to consider a use of different interpolation points. Instead of using equispaced points, we can use Chebyshev nodes,

$$x_{i} = -cos(\frac{i-1}{n}\pi) \quad j = 1, ..., n+1 $$

as the interpolation points. The points are more clustered toward the end.The points produce a more stable interpolant.

## Piecewise Polynomial Interpolation

Polynomial interpolation is an effective tool to approximate a function from a finite set of data points. However, we observed that increase in the polynomial degree does not necessarily improve the accuracy for equispaced data points.

Consider n+1 equispaced data points ($x_{i},y_{i}$) where $i = 1, 2,3,..., n+1$ over [a,b]. We can introduce N = n segments $S_{k} \equiv [x_{k},x_{k+1}]$, $k = 1, ..., N$ delineated by the n+1 points. Denote the length of each segment by h: $h \equiv x_{i+1} - x_{i} = \frac{b-a}{n}$. We then construct a degree 1 polynomial interpolant over each segment $S_{k}$:

$$p_{h,1}^{(k)}(x) = a_{0}^{(k)} +a_{1}^{(k)}x \quad x∈S_{k} \equiv [x_{k},x_{k+1}]$$

such that

$$p_{h,1}^{(k)}(x_k)  = y_{k} \quad and \quad p_{h,1}^{(k}(x_{k+1}) = y_{k+1}$$

The second subscript indicates the degree of the polynomial for each segment. An explicit expression for the interpolant in terms of the data ($x_{k}, y_{k}$) and ($x_{k+1}, y_{k+1}$) is given by

$$p_{h,1}^{(k)}(x) = y_{k} + \frac{y_{k+1} - y_k}{x_{k+1} - x_{k}}(x-x_k)$$

Combining the segment-wise interpolant, we get the follow global interpolant:

$$l_{j}(x) = \begin{cases} p_{h,1}^{(1)}(x), x∈S_1 \\\\ p_{h,1}^{(2)}(x), x∈S_2 \\\\.\\\\.\\\\.\\\\p_{h,1}^{(N)}(x), x∈S_N  \end{cases}$$

A particular value of the interpolant depends only on the data at $x_k$ and $x_{k+1}$

#### Cost

**$O(log_2(N))$**: To find the interpolant point.

**$O(1):$** To evaluate the interpolant.

### General degree-p piecewise interpolation

We can construct piecewise polynomial interpolant base on general degree p interpolant over each segment. To construct N interpolants, we require $Np+1$ data points, assuming each end points is shared by the two abutting segments. For each segment, an interpolant

$$p_{h,p}^{(k)}(x) = \sum_{j=0}^{p}a_j^{(k)}x^j \quad x∈ S_k  $$

such that:

$$p_{h,p}^{(k)}(x_i^{(k)})  = y_{k} $$

here $x_i^{(k)}$ is the i-th interpolation point in the k-th segments.

$$l_{j}(x) = \begin{cases} p_{h,p}^{(1)}(x), x∈S_1 \\\\ p_{h,p}^{(2)}(x), x∈S_2 \\\\.\\\\.\\\\.\\\\p_{h,p}^{(N)}(x), x∈S_N  \end{cases}$$

The interpolant over each segment can be constructed using  the Vandermonde's method or the Lagrange basis method. 

#### Cost

**$O(log_2(N))$**: To find the interpolant point.

**$O(p^3)$**: If we use the Vandermond method

**$O(p^2)$**: If we use the  Lagrange basis method.

### Error Analysis and Convergence rate

We can evaluate the accuracy of our piwcewise polynomial interpolants. We can apply the intepolation error bound obtained in the [Polynomial Interpolation section](#error-analysis).

**Theorem** Suppose we interpolate a smooth function over [a,b] using a piecewise polynomial interpolant with N segments. Suppose that the segments are equal length $h \equiv \frac{b-a}{N}$ and each segment employ a degree p polynomial. Then the error in piecewise polynomial interpolant is bounded from above by

$$|f(x)-p_{n}(x)| = \frac{1}{(p+1)!}\max_{s∈[a,b]}|f^{(p+1)}(s)|(h)^{p+1} \quad ∀x∈[a,b]$$

Key observation:

1. The interpolation error depends on the n+1-st derivative of the underlying function $f^{(n+1)}$
2. The interpolation error depends on the degree p and the segment length h.
3. For a fixed segment length h, if $|f^{(p+1)}|$ grows slower than $(p+1)!$, then the interpolation error decrease exponentially with the degree p.
4. For a fixed polinomial degree p, the interpolation error decreases as $h^{(p+1)}$ with the segment length h. 

There are two ways to decrease the error:

1. Increaseing the degree.
2. Decrease the segment length h by increase N.

## Spline Interpolation

Spline Interpolation is a variation of piecewise polynomial interpolation.  with the additional constrains on the smoothness of the interpolant. We only focus on Cubic spline interpolation in this document. 

As in the case of piecewise polynomial interpolation, we first subdevide the domain [a,b] into N segments deliniated by N+1 equispaced interpolation points. A cubic spine is a piecewise cubic polynomial

$$s_i(x) = a_i + b_i(x-x_i)^1 + c_i(x-x_i)^2 + d_i(x-x_i)^3 $$

The first and second derivatives are continuous across segments,

$$s'_i(x_{i+1}) = s'_{i+1}(x_{i+1}) $$
$$s''_i(x_{i+1}) = s''_{i+1}(x_{i+1})$$

We will have 4N degree of freedom and 4N - 2 constrains when construct a cubic spline. There are a number of constrains, a few common example are:

- **Complete Spline.** We specify the first derivative at the end points of the spline. 

$$S'_1(x_1) = g_L \quad and \quad S'_N(x_{N+1}) = g_{R}$$

    where $g_L$ and $g_R$ are the derivatives specified,

- **Natural Spline** the second derivative at the end points are zero

$$S''_1(x_1) = 0 \quad and \quad S''_N(x_{N+1}) = 0$$

- **Not-a-knot spline** Third derivatie at the first and last interfaces to be continuous:

$$S'''_1(x_2) = S'''_2(x_2) \quad and \quad S'''_{N-1}(x_{N}) = S'''_{N}(x_{N})$$

# Appendix

[1] This README.md were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)
