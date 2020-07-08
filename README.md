## Summer Work
### Irene Wang
#### This is my project/any work that took place over the summer of 2020 as an intern, and I'm utilizing GitHub as a way to track and demonstrate by progress. Everything is virtually self taught.

7/6/20:first.R: My first script starts with 3 simple functions. First, I simulated the rolling of a pair of dice and the computation of their sum by writing a function dubbed `roll()`. This was executed using `sample()`. The next two functions essentially follow the same format. I took equations from my science classes in school and wrote them as functions. The gist of these two functions is that given the input values, it can calculate the result by following the given equation.
```R
source("first.R")
# roll a die
roll()
# 
```
7/7/20:Science.R: This script is an expansion on the science equations in first.R. By utilizing the `uniroot()` function, my code can calculate any missing variable in the equation, given that the other parameters are inputed. This is done by giving `uniroot()` an interval to search for the answer. In order to ensure that all realistic values and answers can be produced, I set an extremely large interval: `c (-100000, 100000)`, or `c(0, 100000)` (for mass). I eliminated `delt` from the original function so that this function can solve for `t1` or `t0`.

7/8/20:fairdie.R: This script is an expansion on the dice simulation in first.R. I slightly rewrote `roll()` into `roll2()` in order to simulate the rolling of one singular die. From there, I utilized `set.seed()` in order to reproduce "random" results (it's not truly random, however, because a computer can't produce random figures). 
From there, I replicated the rolling of a die 60 times and constructed a table using `data.frame()`. Using the equation for margin of error, (O-E)/E, I can estimate the "fairness" of the die. I then repeated this with different sample sizes: 120, 480, 2400, 12000 rolls and compared results. The practice of statistics tells me that as sample size increases, the observed results get closer and closer to the expected results because the margin of error gets smaller and smaller. 
A chi-squared test, `chisq.test()`, can test if the die is fair by checking it with a p-value = .05 for $\alpha$. Thus, rolling the die 60 times leads to a rejection of the null hypothesis (which is that the die is fair), but for the other rolls of a larger sample size, you would fail to reject the null, meaning the die does appear to be fair. 
`chisq.test(fair4.die$observed, p = rep(1/6, 6))` executes the chi-squared test; however, `chisq.test(tmp4)` does the same thing.