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
[I] = intmidpoint (fun,a,b)
disp(I)
```
Output I = $\frac{x^2}{2}|_0^1 =0.5$
```
I = 0.5000
```

good approximation for this function.