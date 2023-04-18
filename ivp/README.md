# Initial Value Problem

## Runge Kutta method.

Runge-Kutta family of schemes, we consider a two-stage Runge-Kutta Method (RK2). The method advances the solution from $\tilde{u}^{j-1}$ to $\tilde{u}^j$ by the following sequence of updates

$$v_1 = \tilde{u}^{j-1} \quad \quad F_1 = f(v_1,t^{j-1})$$
$$v_2 = \tilde{u}^{j-1}+\frac{1}{2}\Delta t F_1 \quad \quad F_2 = f(v_2,t^{j-1}+\frac{1}{2}\Delta t)$$
$$\tilde{u}^j = \tilde{u}^{j-1} + \Delta tF_2$$

RK2 is an explicit scheme and only require two evaluations of f to compute $F_1$ and $F_2$