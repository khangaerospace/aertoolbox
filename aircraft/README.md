# Aircraft 

## Lift

Coefficient of lift ($C_l$) can be find using the following equation 

$$C_l = \frac{W}{\frac{1}{2}\rho_\infty U_\infty^2S}$$

Where W is the aircraft weight, $\rho_\infty$ is the air density, $U_\infty$ is the aircraft speed and $S$ is the aircraft wing span

Calculate Coefficient of lift ($C_l$) using ```CoeLift(W, rho, V, S)``` in the aertoolbox.

We can then calculate the aircraft lift during cruise when the Lift of the aircraft equal to the aircraft weight ($L=W$) using the following equation.

$$L = W = \frac{1}{2}\rho_\infty V_{stall}^2S C_{l{max}}$$

The stall speed ($V_{stall}$) is the minimum speed the aircraft can travel at a certain altitude due to the air density. The buffet (flutter) speed is the maximum speed the aircraft can travel. If the air craft travel faster than the buffet speed, there will be vibration cause by shock wave due to flow seperation on the aircraft. An aircraft must travel faster than the stall been, but lower than the buffet speed.

## Straight, Level Flight, Constant Speed

In a straight and level flight with constant speed, there are no acceleration and therefore sum of force and moments are zeros:

$$\sum F = 0 \quad \sum M = 0$$

We will get the lift equal to the weight of the aircraft ($L = W$). The Thurst force is also equal to the drag $T = D$ assuming that the thurst vector aligned with the drag.

Rolling moment and pitching moment are zero due to the aircraft symmetry. Pitching moment must also be zero.

## Static Longitudial Stability

We define the aerodynamic center of an aircraft is where the moment does not change with angle of attack ($\alpha$) or $\frac{\partial M_{ac}}{\partial \alpha} = 0$


Some key observation 

1. If $\alpha$ increase then the lift $L$ would increase but not the moment about the aerodynamic center ($M_{ac}$).
2. If the aerodynamic center $(ac)$ behind the center of mass ($C_m$). The moment cause by the increase in lift is in the direction of nose down which cause a restoring torque to make the airplane become stable.

**Trim:** is the adjustment of the aerodynamic force so that the aircraft is stable without input (passive stable)

## Climb at constant speed



For climb with constant speed, we want to gain more potential energy $T>D$. Thus we want 

$$L-D-Wsin(\theta) =0$$
$$L= Wcos(\theta)$$

## Breguet Range Equation

**Breguet range equation** is the relationship between the aircraft weight and travelling range. In this section, we will consider a turbojet. The relationship between the weight and time

$$\frac{dw_f}{dt} = -TSFC \cdot T$$

where $TSFC$ is the thurst specific feul consumption which is the feul consumption by weight per unit time per unit thurst in unit $1/t$. We will consider straight level flight $L=D$ and $T=D$. We can re-write the equation. 

$$\frac{dw}{dt} = -TSFC \cdot D$$

The airspeed ignoring wind

$$\frac{dR}{dt} = V$$

We can find the relationship between distance weight

$$\frac{dR}{dW} = \frac{dR/dt}{dW/dt} = \frac{-V}{TSFC \cdot D}$$

with some manipultion, we get the Breguet range equation

$$R = \frac{V}{TSFC}\frac{L}{D}ln(\frac{w_i}{w_f})$$

where

 $$w_i = (W_\textrm{empty aircraft} + W_{payload} + W_{feul} + W_{\textrm{re}serve feul})$$

$$w_f = W_\textrm{empty aircraft} + W_{payload}+ W_{\textrm{re}serve feul})$$

$$\frac{W_i}{W_f} = 1 + \frac{W_{feul}}{W_{ea}+W_p +W_{rf}}$$

Therefore, our final form of the Breguet range equation 

$$R = \frac{V}{TSFC}\frac{L}{D}ln(1 + \frac{W_{feul}}{W_{ea}+W_p +W_{rf}})$$

There are some assumption with this equation

1. TSFC: is constant
2. V: is constant
3. angle of attack ($\alpha$) is constant so $\frac{L}{D}$ is constant

## Aircraft Performance

### Acceleration for Longitudial flight


