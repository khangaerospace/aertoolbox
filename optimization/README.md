# Optimization

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

Optimization problems are ubiquitous in engineering and science. One example in aerospace engineering is aerodynamic shape optimization: here, we wish to optimize the shape of the aircraft such that we can minimize the drag at a given lift subject to structural constraints.

Mathematically, a general optimization problem can be stated as the following:

$$\min g(x)$$
$$\text{subject to }  c_1(x) \leq 0$$
$$c_2(x) = 0$$

We identify different components of the statement:
 
 - $x$: design variable
 - $g$: objective function which we wish to minimize.
- $c_1$: inequality constraints
- $c_2$:  equality constraints

We wish to find a n-vector of the design variable which minimizes the objective function subject to inequality constraints and equality constraints.

## Newton’s method for unconstrained optimization

First, consider a simple case. We want to look for the following:

1. Local Minnimum
2. of smooth function
3. without a constrain

From calculus, smooth function must satisfy the following conditions for single variable function

1. First derivative is 0 (No slope at that point)
2. The second  derivative must be positive

For multiple variables

1. The gradient must vanish
$$\nabla g(x^*) = 0$$
2. The Hessian of the function is symmetric positive definite (SPD)
$$\nabla^2g(x^*) \text{ is SPD}$$

**Classification of stagnation points** for a smooth function, we can classify a stagnation point based on the eigenvalues of the Hessian:

1. All eigenvalues are strictly positive, the stagnation is a local minimum
2. At least one eigenvalues negative. the stagnation is **not** a local minimum
3. All eigenvalues are non-negative and one of them at 0. the stagnation may or may not be a local minimum.

## Appendix

[1] This README.md were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)