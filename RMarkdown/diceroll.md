Dice Roll
================

\#Roll a Die

## First

**7/6/20:first.R**: My first script starts with 3 simple functions.
First, I simulated the rolling of a pair of dice and the computation of
their sum by writing a function dubbed `roll()`. This was executed using
`sample()`. The next two functions essentially follow the same format. I
took equations from my science classes in school and wrote them as
functions. The gist of these two functions is that given the input
values, it can calculate the result by following the given equation.

``` r
source("../R/first.R")
roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
} 
roll()
```

    ## [1] 8

\#\#Second

**7/8/20:fairdie.R**: This script is an expansion on the dice simulation
in first.R. I slightly rewrote `roll()` into `roll2()` in order to
simulate the rolling of one singular die. From there, I utilized
`set.seed()` in order to reproduce “random” results (it’s not truly
random, however, because a computer can’t produce random figures).

From there, I replicated the rolling of a die 60 times and constructed a
table using `data.frame()`. Using the equation for margin of error,
(O-E)/E, I can estimate the “fairness” of the die. I then repeated this
with different sample sizes: 120, 480, 2400, 12000 rolls and compared
results. The practice of statistics tells me that as sample size
increases, the observed results get closer and closer to the expected
results because the margin of error gets smaller and smaller.

A chi-squared test, `chisq.test()`, can test if the die is fair by
checking it with a p-value = .05 for \(\alpha\). Thus, rolling the die
60 times leads to a rejection of the null hypothesis (which is that the
die is fair), but for the other rolls of a larger sample size, you would
fail to reject the null, meaning the die does appear to be fair.
`chisq.test(fair4.die$observed, p = rep(1/6, 6))` executes the
chi-squared test; however, `chisq.test(tmp4)` does the same thing.

``` r
source("../R/fairdie.R")
set.seed(123)
roll2(times = 60)
```

    ##  [1] 3 6 3 2 2 6 3 5 4 6 6 1 2 3 5 3 3 1 4 1 1 5 3 2 2 1 6 3 4 6 1 3 5 4 2 5 1 1
    ## [39] 2 3 4 5 5 3 6 1 2 5 5 4 5 2 1 1 3 1 6 5 1 2

``` r
tmp <- table(roll2(times = 60))

fair.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp1),
                       expected = 10)
fair.die
```

    ##   value observed expected
    ## 1     1       22       10
    ## 2     2       20       10
    ## 3     3       15       10
    ## 4     4       18       10
    ## 5     5       25       10
    ## 6     6       20       10

\#\#Third

**7/16/20:biaseddie.R**: This code is an expansion on fairdie.R, where I
instead make a weighted die where the probability of rolling a six is
3/8 and the probability of rolling 1 to 5 is 1/8. I then carried out the
tests and repeated trials from fairdie.R to compare the “fairness” of
the die.

``` r
source("../R/biaseddie.R")
tmp <- table(roll(times = 12000))

biased.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp),
                       expected = 2000)
biased.die
```

    ##   value observed expected
    ## 1     1     1489     2000
    ## 2     2     1411     2000
    ## 3     3     1546     2000
    ## 4     4     1516     2000
    ## 5     5     1441     2000
    ## 6     6     4597     2000

Unsurprisingly, the amount of sixes rolled was much larger compared to
the other numbers, and thus, the chi-sq test produced an extremely small
p-value: indicating a rejection of the null hypothesis that the
probability of rolling each number is equal. Thus, in trade, if such
bias was made, the person the bias favors can gain a significant amount.
