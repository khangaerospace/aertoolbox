# Aircraft 

## Lift

Coefficient of lift ($C_l$) can be find using the following equation 

$$C_l = \frac{W}{\frac{1}{2}\rho_\infty U_\infty^2S}$$

Where W is the aircraft weight, $\rho_\infty$ is the air density, $U_\infty$ is the aircraft speed and $S$ is the aircraft wing span

Calculate Coefficient of lift ($C_l$) using ```CoeLift(W, rho, V, S)``` in the aertoolbox.

We can then calculate the aircraft lift during cruise when the Lift of the aircraft equal to the aircraft weight ($L=W$) using the following equation.

$$L = W = \frac{1}{2}\rho_\infty V_{stall}^2S C_{l{max}}$$

The stall speed ($V_{stall}$) is the minimum speed the aircraft can travel at a certain altitude due to the air density. The buffet (flutter) speed is the maximum speed the aircraft can travel. If the air craft travel faster than the buffet speed, there will be vibration cause by shock wave due to flow seperation on the aircraft. An aircraft must travel faster than the stall been, but lower than the buffet speed.