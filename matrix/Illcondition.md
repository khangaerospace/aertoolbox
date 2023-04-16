# Ill-conditioned system

The [condition number](https://github.com/khangaerospace/aertoolbox/blob/main/matrix/Conditioning%26Stability.md) plays an important role in the numerical solution of linear systems. The ill-conditioning of the system is reflected in the condition number. A linear system with a large condition number is said to be ill-conditioned.

The condition number plays a particularly important role when the computation is carried out
using floating-point arithmetic. If the system is ill-conditioned, then even the very small error in floating point representation can be amplified to yield completely different solutions. Hence, regardless of the algorithm used to solve $Ax = b$, we cannot expect to obtain an accurate solution if the system x is ill-conditioned.