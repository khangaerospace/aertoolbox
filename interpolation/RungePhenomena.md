# Runge's Phenomena

For some functions, increasing the polynomial degree p does not result in smaller error when interpolating. An example is the Runge Function:

$$f(x) = \frac{1}{1+25x^2}$$

This is a very undesirable result. However, This lact of convergence can be predicted by the interpolation error bound discussed in [README.m](https://github.com/khangaerospace/aertoolbox/blob/main/interpolation/README.md). The maximum value of the higest derivatives increase very rapidly for Runge function with n.