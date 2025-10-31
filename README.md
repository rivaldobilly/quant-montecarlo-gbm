# Monte Carlo Option Pricing using Geometric Brownian Motion

## Overview
This project simulates stock price paths using Geometric Brownian Motion (GBM) and applies Monte Carlo estimation to price a European call option.  
It also compares the simulation with the analytical Black–Scholes price and provides visualizations of sample paths and terminal price distributions.

## Keywords
quant-finance, monte-carlo, black-scholes, stochastic-processes, financial-mathematics, python, data-science, numerical-methods

---

## Mathematical Background

### 1. Stochastic Differential Equation (SDE)
The stock price $S_t$ follows
$$dS_t = \mu S_t \, dt + \sigma S_t \, dW_t$$
where  
- $\mu$: expected return (drift)  
- $\sigma$: volatility  
- $W_t$: Wiener process (Brownian motion)

### 2. Applying Ito’s Lemma
For $ f(t, S_t) = \ln S_t $:
$$
df = \frac{\partial f}{\partial t} dt + \frac{\partial f}{\partial S} dS_t + \frac{1}{2} \frac{\partial^2 f}{\partial S^2} (dS_t)^2
$$
Substitute and simplify using $ (dW_t)^2 = dt $, $ dt^2 = 0 $, $ dt\, dW_t = 0 $:
$$
d(\ln S_t) = (\mu - \frac{1}{2}\sigma^2)dt + \sigma dW_t
$$
Integrating from $ 0 $ to $ T $:
$$
S_T = S_0 \, e^{(\mu - \frac{1}{2}\sigma^2)T + \sigma W_T}
$$

### 3. Monte Carlo Option Pricing
Simulate $ S_T $ many times (N paths) and estimate the discounted payoff:
$$
C_0 = e^{-rT} \, \mathbb{E}[\max(S_T - K, 0)]
$$

---

## Code Overview
The code performs the following steps:
1. Simulate Brownian motion paths and corresponding stock prices under GBM.
2. Compute terminal prices $ S_T $.
3. Estimate the Monte Carlo price of a European call option.
4. Compare it with the Black–Scholes analytical price.
5. Visualize the sample paths and terminal price distribution.

---

## Setup Instructions

### Option 1: Local Run
```bash
git clone https://github.com/<yourusername>/quant-montecarlo-gbm.git
cd quant-montecarlo-gbm
pip install numpy matplotlib scipy
python professional_script.py
```

### Option 2: Docker
```bash
docker build -t quant-montecarlo .
docker run -p 8888:8888 quant-montecarlo
```

This will open Jupyter Lab inside the container at http://localhost:8888.

### Sample Output

```bash
Monte Carlo vs Black–Scholes Pricing:

Monte Carlo price: 10.4365 ± 0.0834 (95% CI)
Black-Scholes analytical price: 10.4506
```

Visualizations:

- Simulated Stock Price Paths: 10 random GBM paths showing stochastic price evolution.

- Distribution of Terminal Prices ($S_T$): Histogram displaying lognormal distribution of simulated prices.

### Project Structure

```bash
quant-montecarlo-gbm/
├── outputs/
│   ├── paths_plot.png
│   └── terminal_dist.png
├── src/
│   └── pricer.ipynb
├── Dockerfile
├── README.md
└── requirements.txt
```

## TO-DO

- Work with real past stocks data
- Fix LaTeX