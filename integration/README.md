# Numerical integration

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

Integration is a fundamental concept in mathematics, but there are functions $f$ that do not have an analytical expression for their antiderivative, or we may only be able to evaluate $f$ at a finite number of points. In such cases, we turn to numerical approximation methods for definite integrals.

Consider the definite integral:

$$I = \int_a^bf(x)dx$$

To approximate this integral using a finite number of evaluations of $f$, we use numerical integration techniques.

## Newton-Cotes rules

We consider an approximation of the integral of the form

$$I = \int_a^bf(x)dx = \sum_{i=1}^mw_if(x_i)$$

the points $x_i$ are called quadrature points the weights $w_i$ are called called quadrature weights, and the points and weights together define a quadrature rule.

We can define various quadrature rules by considering different sets of quadrature points and weights. One approach to find a quadrature rule is to first approximate the integrand f by an interpolant pn, then compute the integral of the interpolant, and finally identify the points and weights.

The m-point Newton-Cotes rule is given by

$$Q_{NC(m)} = \int_a^bp_{m-1}(x)dx$$

where $p_{m-1}(x)$ s the degree m − 1 polynomial interpolant based on m equispaced interpolation points over [a,b]. Read more about [interpolation](https://github.com/khangaerospace/aertoolbox/tree/main/interpolation)

Some example of the Newton-Cotes rules that aertoolbox have will be discuss below

### Midpoint rule

The midpoint rule is induced by the constant interpolant with the midpoint $c \equiv \frac{a+b}{2}$  as the interpolation point. An explicit expression for the interpolant is given by

$$p_0(x)=f(c)=f(\frac{a+b}{2})$$

Given our approximation to $p_0$ to $f$ e approximate the integral by integrating $p_0$ over [a,b]

$$I \approx Q_{midpoint} \equiv \int_a^bf(c)dx=(a-b)f(c)$$

We can use the ```intmidpoint()``` function in aertoolbox to do midpoint integration

Example of integrating $\int_0^1x dx$:
```
fun = @(x) x;
a = 0;
b = 1;
[I] = intmidpoint(fun,a,b)
disp(I)
```
Output I = $\frac{x^2}{2}|_0^1 =0.5$
```
I = 0.5000
```

#### Midpoint rule error
The integration error associated with the midpoint rule for the integral is bounded by

$$|I-Q_{midpoint}| = \frac{1}{24} \max |f''(s)|(b-a)^3$$

Key observation:
1. The error depends on the second derivative of the underlying function. If the integrand is a linear function, then the midpoint rule is exact.
### Trapezoid rule.

Trapezoid rule is derived from the linear interpolant based on m = 2 interpolation points. Our approximation is given by integrating over $p_1(x)$ on interval [a,b] to get the Trapezoid reule integration:

$$I \approx Q_{NC(2)} = (b-a)(\frac{1}{2}f(a)+\frac{1}{2}f(b))$$

We can use the ```intTrapezoi()``` function in aertoolbox to do midpoint integration

Example of integrating $\int_0^1x dx$:
```
fun = @(x) x;
a = 0;
b = 1;
[I] = intmidpoint(fun,a,b)
disp(I)
```
Output I = $\frac{x^2}{2}|_0^1 =0.5$
```
I = 0.5000
```
Error for Trapezoid rule
$$|I-Q_{NC(2)}| = \frac{1}{12} \max |f^2(s)|(b-a)^{(3)}$$

### Simpson's rule

Simpson’s rule is induced by the quadratic interpolant based on m = 3 equispaced interpolation points, including the endpoints a and b.

We can use the ```intSimpson()``` function in aertoolbox to do midpoint integration

Example of integrating $\int_0^1x dx$:
```
fun = @(x) x;
a = 0;
b = 1;
[I] = intSimpson(fun,a,b)
disp(I)
```
Output I = $\frac{x^2}{2}|_0^1 = 0.5$
```
I = 0.500
```

Error for Simpson's rule
$$|I-Q_{NC(2)}| = \frac{1}{2880} \max |f^4(s)|(b-a)^{(5)}$$
### Error in Newton-Cotes rules

The error for closed Newton-Cotes rules:

$$|I-Q_{NC(m)}| = \frac{1}{m!} \max |f^m(s)|(b-a)^{(m+1)}$$

and the error is abounded by 

$$|I-Q_{NC(m)}| = \begin{cases}C_m \max |f^m(s)|(b-a)^{(m+1)}\\\\ C_m \max |f^{m+1}(s)|(b-a)^{(m+2)}\end{cases}$$

Key observation:

1. When the number of points m is even, the error depends on the m-th derivative of the integrand. The quadrature rule is exact for degree m − 1 polynomials.
2. hen the number of points m is odd, the error depends on the m + 1-st derivative of the integrand. The quadrature rule is exact for degree m polynomials.
### Drawback of Newton-Cotes rules
Newton-Cotes rules are commonly use in practice. But one major drawback is they do not converge for general $f$ as $m \to \infty$

An example is [Runge Function](https://github.com/khangaerospace/aertoolbox/blob/main/interpolation/RungePhenomena.md)
## Composite rules

As in the case of interpolation, we can improve the accuracy of the integration rules by dividing the segment [a, b] into smaller segments and by using a quadrature rule on each of the segments.

## Advance Intergration 

If we want to integrate a function $\widetilde{f}$ over an interval [a,b] we then need to tranform the quadrature points and weights. The transformation is given by

$$\int_a^b\widetilde{f}(\widetilde{x})d\widetilde{x} = \sum _{i=1}^m\widetilde{w_i}\widetilde{f}\widetilde{x_i}$$

where 

$$\widetilde{x_i} = a + \frac{b-a}{2}(x_i+1)$$
$$\widetilde{w_i} = \frac{b-a}{2}(x_i+1)w_i$$

### Clenshaw-Curtis quadrature

Since the [Newton Cotes rules](#drawback-of-newton-cotes-rules) doesn't converge for every functions. We use more stable interpolants associated with the Chebyshev nodes.The quadrature rule has the form

$$Q_{cc} = \sum_{i=1}^mw_if(x_i)$$

where $x_i$ are the Chebyshev nodes over [-1,1]

$$x_i = -cos(\frac{(i-1)\pi}{m-1})$$

and $w_i$ are the weight

$$w_i = \int_{-1}^1l_{Chebyshev,i}(x)dx$$

and $l_{Chebyshev,i}$ are the Lagrande basis polynomial associated with the Chebyshev nodes

### Gauss Quadrature

The Gauss quadrature provides the higest order id accuracy for a given number of function evaluations.

**m=1 points rule** Construct m=1 Gauss quadrature rule

$$Q_{Gauss(1)} = w_1f(x_1)$$

we want to identify the weight $w_i$ and the point $x_i$ that provide the higest order of accuracy. Choosing monomials {1,$x$} as the basis functions for convenience, this exact itegration condition translates to 
$$f(x =1) \quad w_1f(x_1)=w_1=\int_{-1}^11dx=2$$
$$f(x =x) \quad w_1f(x_1)=w_1x_1=\int_{-1}^1xdx=0$$

We observe that $w_1 =2$ and $x_1=0$ provide tha desired result. Hence m=1 Gauss quadrature rule is 

$$Q_{Gauss(1)} = 2f(0)$$

This is the midpoint rule that we dicussed above. It can integrates exactly polynomials of degree two using just one point.

**m=2 point rule** The quadrature rule will be in the form

$$Q_{Gauss(2)} = w_1f(x_1)+w_2f(x_2)$$

we want to identify the weights $w_1$ and $w_2$ and the points $x_1$ and $x_2$ that provide the higest order of accuracy.

After some algebratic manipulation we get $x_1 =\frac{-1}{\sqrt{3}}$ $x_2 =\frac{1}{\sqrt{3}}$ and $w_1=w_2=1$. Hence the form for m=2 Gauss quadrature rule is

$$Q_{gauss(2)} = f(\frac{-1}{\sqrt{3}})+f(x_1 =\frac{1}{\sqrt{3}})$$

**General m point rule** has the following form

$$Q_{Gauss(m)} = \sum_{i=1}^mw_if(x_i)$$

#### Error analysis for Gauss quadrature

The error in the m-point Gauss quadrature is bounded from above by

$$|\int_{-1}^1f(x)dx-Q_{Gauss(m)}|\leq \frac{(m!)^4}{(2m+1)((2m)!)^3}\max|f^{2m}(x)|$$

### Adaptive simpson's method

Gauss quadrature rule is limited for non-smooth functions.

There are two key concepts for adaptive quadrature rules

1. An error estimate which assesses the error associated with the current approximation. 
2. An adptive selection of segment lengths based on the error estimate.

The approximation of the integral based on the adaptive Simpson's rule is 

$$I = \int_a^bf(x)dx \approx \sum_{i=0}^NQ_{NC(3)}([x_i,x_{i+1}]) = \sum_{i=0}^NQ_{NC(3)}([x_i,x_{i+1}^{mid}])+Q_{NC(3)}([x_i^{mid},x_{i+1}])$$

where $x_i^{mid} =\frac{1}{2}(x_i+x_{i-1})$

Error estimation is

$$E([a,b]) \equiv \frac{1}{15}|Q^{(2)}_{NC(3)}([a,b])-Q_{NC(3)}([a,b])|$$

# Appendix

[1] This README.md were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)