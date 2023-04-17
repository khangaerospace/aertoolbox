# Differentiation

**NOTE:** This README requires a [MathJax](https://chrome.google.com/webstore/detail/mathjax-plugin-for-github/ioemnmodlmafdkllaclgeombjnmnbima/related) browser plugin for the mathematics to be rendered.

We can estimate the derivative by finite difference formulars. These techniques play a key role in the development of numerial methods for ODE and PDEs

## First derivative
### Forward difference

we want to approximate 

$$f'(x_i) = \frac{\partial f}{ \partial x}$$

by $(x_i,f_i)$ and $(x_{i+1},f_{i+1})$

The forward difference approximation of the first derivative is 

$$f'(x_i) \approx \frac{f_{i+1}-f_i}{x_{i+1}-x_i}$$

### Backward difference

Backward difference formular approximate $f'_i$ base on $x_i$ and $x_{i-1}$. The backward formular

$$f'(x_i) \approx \frac{f_i-f_{i-1}}{\Delta x}$$

### Central difference

Backward difference formular approximate $f'_i$ base on $x_{i-1}$ and $x_{i+1}$.The formular is given by

$$f'(x_i) \approx \frac{f_{i+1}-f_{i-1}}{2 \Delta x}$$

## Second derivaties

Second order central difference formular

$$f'(x_i) \approx \frac{f_{i+1}-2f_i +f_{i-1}}{ \Delta x^2}$$

## Appendix

[1] This README.md were constructed using [AER336](https://engineering.calendar.utoronto.ca/course/aer336h1) lecture note from proffessor Masayuki Yano (2023)