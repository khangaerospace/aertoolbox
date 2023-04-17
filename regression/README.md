# Regression

Regression is often used in two different contexts.
 

 1. **Prediction.** Suppose we are given a noisy dataset consisting of $m$ data points $(x_i,Y_i)$. We then wish to predict the value of $Y$ for an arbitrary value of $x$.
 2. **Inference.** Suppose we are given a parametrized model, but we do not know the value of the parameter. Given a noisy dataset consisting of $m$ data points$(x_i,Y_i)$ we wish to predict the value of the parameter that best describe the behavior.

## Response model

We first propose a model for the relationship between the input $x$ and output $Y$, with the form

$$Y = Y_{model}(x,\beta) + \epsilon(x)$$

where $x$ is the independent variable, $Y$ is the measured quantity, $Y_{model}$ is the predictive model with no noise, ϵ is a noise.

### Example  simple two degrees-of-freedom model for $Y_{model}$

To simplify the presentation, we will first consider a simple two degrees-of-freedom model for $Y_{model}$.

$$Y_{model}(x;\beta) = \beta_0 + \beta_1x$$

where $β_0$ and $β_1$ are the components of the model parameter. We now introduce the key assumption: our model is unbiased.  That is, in the absence of noise $(ϵ = 0)$, our underlying input-output relationship can be perfectly described by

$$y(x) = Y_{model}(x;\beta^{true})$$

We also introduce assumptions on the characteristics of the noise. These assumptions allow us to make quantitative (statistical) claims about the quality of our regression.

1. **Normality** We assume the noise is normally distributed with zero mean
2. **Homoscedasticity.** We assume that the distribution of the noise ϵ, as characterized by $σ^2$, does not depend on x.
3. We assume that $ϵ(x_1)$ and $ϵ(x_2)$, $x1 \neq x2$, are independent and hence uncorrelated.

## Parameter estimation

Given a parametrized response model $Y_{model}(\cdot;\beta^{true})$ ) and m noisy datapoints we wish to estimate the true parameter $\beta^{true}$. We will in fact estimate both the true parameter β true and the noise standard deviation σ from the data.

One way to estimate $\beta^{true}$  is to consider the maximum likelihood estimator (MLE), the most likely value of the parameter given the measurements. We will denote the MLE by $\hat{\beta}$ The MLE is
given by the [least-squares fit](https://github.com/khangaerospace/aertoolbox/tree/main/leastsquare):

$$\hat{\beta} = \text{arg min} ||X\beta + Y||_2$$ 


Once we estimate the unknown parameter $\beta^{true}$, we may estimate the npit standard deviation by $\sigma$ by $\hat{\sigma}$ given

$$\hat{\sigma} = (\frac{1}{m-1}||X\hat{\beta} -Y||_2^2)^{1/2}$$

## Confidence intervals

### Individual

We will consider two different sets of confidence intervals.  The first is the confidence interval associated with individual parameters: we will construct two confidence intervals $I_0$ and $I_1$ associated with the parameters $\beta_0$ and $\beta_1$ respectively

****
CONTINUE