# Linear System: Conditioning and stability

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

In this document, we will discuss the conditioning of linear system. We will then talk about the stability of LU factorization, andmake modifications to the "vanilla" [LU factorization](https://github.com/khangaerospace/aertoolbox/blob/main/matrix/factorization.md) to improve the stability.

## Scientific notation

In a typical computer, numbers are represented as floating point numbers using a finite number of bits. Before we provide a formal definition of the floating-point arithmetic, we first relate floating-point numbers to something we are farmiliar: scientific notation. Real numbers expressed in sciencetific notation are of the form

$$\widetilde{x} =\pm m\times10^e$$

where m is the mantissa, which is a real number range [1,10), and e is the exponent, which is an integer

1. number of digits in the mantissa m controls the relative precision of the number
2. the range of the exponent e is controls the range of numbers that can be represented.

## Floating point arithmetic

Floating point number are of the form 

$$\widetilde{x} = \pm (m/\beta^t)\times \beta^2$$

Where $\beta \in \Z$ is the base, $m \in \Z$ is the range, $t \in \Z$ is the precision,  and $e \in \Z$ id the exponent. The quantity $\pm(m/\beta^t)$ is caleed the mantissa.

Key observation:

1. The precision t determines the number of "significant figures" is the mantissa. which in turn controls the relative precision of floating-point numbers.
2. The range of the exponent $e$ determines the range of numbers that can be represented.

Scientific notation with four digits is a special case of the floating-point number representation with $\beta = 10$ and $t = 4$ 

The real number represented in the sciencetific notation and floating point arithmetic controls the relative precision and not the absolute precision. For any real number x, there exitst $\tilde{x}$ a number such that

$$\tilde{x} = x(1+ є)$$

for some $є<є_{machine}$, where $є_{machine}$ is caleed the machine precision.

The double-precision floating-point arithmetic provides sufficient (relative) precision for most
situations. However, poorly designed algorithm can be affected by rounding errors. In fact, being
stable and not affected by rounding errors is one of the fundamental criteria of a usable algorithm.

## Conditioning number

Condition number characterizes the stability of a linear system. The condition number plays an important role in the characterization of algorithms that “approximately” solve a linear system $Ax = b$.  This “approximation” might arise because we consider a solution method that is designed to solve the equation approximately.

If the system is $Ax = b$, we consider a perturbed system

$$A(x+\delta x) = b+\delta b$$

where $\delta b$ is a small perturbation to the equation and $\delta x$ represents the associated perturbation in the solution; we observe $A\delta x = \delta b$. We want to compute the relative size of the two perturbation

$$\frac{||\delta x||_2}{||x||_2} \quad vs \quad \frac{||\delta b||_2}{||b||_2}$$

The ratio of the relative perturbation in the solution to the relative perturbation in abounded by $||A^{-1}||_2||A||_2$.  This number is called the condition number and is denoted by $\kappa(A)$

$$\kappa(A) = ||A^{-1}||_2||A||_2$$

therefore we get:

$$\frac{||\delta x||_2}{||x||_2} \leq \kappa(A) \frac{||\delta b||_2}{||b||_2}$$

We can consider a few other characterizations of the condition number. Reminder about these characteristic of the second norm of a matrix $||A^{-1}||_2 = \sigma_{\min}(A^{-1})^{-1}$ and $||A||_2 = \sigma_{\max}(A)$ Hence, the condition number can also be re-write as:

$$\kappa(A) = \frac{\sigma_{\max}(A)}{\sigma_{\min}(A)}$$

Which we can easily find using the Matlab ```max()``` and ```min()``` function.

For a SPD matrix, since the eigenvalues and the singular values are the same, we may express the condition number as

$$\kappa(A) = \frac{λ_{\max}(A)}{λ_{\min}(A)}$$

For an orthogonal matrix Q, the condition number is unity (κ(Q) = 1) because all of its singular values are 1.

When the system as a large condition number, we call these system as [Ill- condition](https://github.com/khangaerospace/aertoolbox/blob/main/matrix/Illcondition.md)

## Appendix

[1] This document were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)