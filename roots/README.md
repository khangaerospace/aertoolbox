# Roots Finding

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

The definition of a root: given a function is a root (or zero) of $f$ if

$$f(x^*) = 0$$

Then, the goal of a root-finding problem is to find a root of the function.

## Bisection method

Bisection method is a root-finding method based on the idea of bracketing, the idea of iteratively refining an interval in which a root lies. The bisection method requires two initial guesses $a^0$ and $b^0$. such that ```sign(f(a^0))``` and ```sign(f(b^0))```  are different. If f is continuous, then the different signs of $f(a^0)$ and $f(b^0)$  implies that there is a root in the interval $[a^0,b^0]$ The bisection method is based on an iterative refinement of this interval that is guaranteed to contain a root: a single step of the bisection method is the following:

1. Set c^i = (a^i+b^i)/2 and evaluate $f(c^i)$
2. if ```sign(f(a))``` and ```sign(f(b))```  then set $a^{i+1} = c^i$ and $b^{i+1} =b^i$ otherwise set $a^{i+1} = a^i$ and $b^{i+1} = c^i$

**Termination Criteria** Because the bisection method is an iterative algorithm, we must provide a termination criteria. There are two commonly used termination criteria.

1. based on the length of the interval

$$ |b^i-a^i| \leq \delta_{tol}^x$$

2. based on the function value at one of the approximations

$$|f(a^i)| \leq \delta^f_{tol}$$

**Convergence:**

$$|b^i-a^i| = \frac{1}{2^i} |b^0-a^0|$$

**Advantages and disadvantages**. Perhaps the biggest advantage of the bisection method is that, for continuous functions, it is guaranteed to converge assuming the initial bracket $[a^0, b^0]$ can be found. Unfortunately, the convergence is not as some other methods, and the scheme does not extend naturally to higher dimensions.

## Newton's Method

Newton’s method, which is also known as the Newton-Raphson method, is another iterative procedure to find a root of a nonlinear function. Given a initial guess $x^0$ for a root, Newton’s method update the value according to

$$x^{i+1} = x^i-\frac{f(x^i)}{f'(x^i)}$$

**Termination Criteria** There are a few different types of termination criteria commonly used in Newton’s method.

1. One approach is to compute the size of the update taken in a single step and to terminate if the update is small:

$$|x^{i+1} - x^i| \leq \delta_{tol}^x$$

2. Another approach is to ensure that the function value is sufciently close to zero.

Newton’s method converge quadratically

## Secant method

Instead of using the deriviative, we use the approximation of the derivative. This method require initial guess $x^{-1}$ and $x^0$. The steps are given by

$$x^{i+1} = x^i - \frac{x^i-x^{i-1}}{f(x^i) - f(x^{i-1}) }f(x^i)$$

**Termination Criteria** is the same as [Newton Method](#newtons-method).

## System of nonlinear equations

We can generalize Newton’s method that we considered for scalar equations to vector valued functions in a straightforward manner.

0. Make an initial guess $x^0$
1. Evaluate the function and its Jacobian

$$f(x^i) \quad and \quad \nabla f(x^i)$$

2. Solve a linear system for $\delta x^i \equiv x^{i+1} -x^i$

$$\nabla f(x^i)\delta x^i = - f(x^i)$$

3. Update the solution
   $$x^{i+1} = x^i+\delta x^i$$
4. Check for convergence.

## Appendix

[1] This README.md were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)
