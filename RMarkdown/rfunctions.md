R Functions
================

## First

[**7/6/20:first.R**](../R/first.R): My first script starts with 3 simple
functions. First, I simulated the rolling of a pair of dice and the
computation of their sum by writing a function dubbed `roll()`. This was
executed using `sample()`. The next two functions essentially follow the
same format. I took equations from my science classes in school and
wrote them as functions. The gist of these two functions is that given
the input values, it can calculate the result by following the given
equation.

``` r
source("../R/first.R")
newton1 <- function(m, a) {
  f = m * a 
  f
}
newton1(m = 5, a = 3)
```

    ## [1] 15

## Second

[**7/7/20:science.R**](../R/science.R): This script is an expansion on
the science equations in first.R. By utilizing the `uniroot()` function,
my code can calculate any missing variable in the equation, given that
the other parameters are inputed. This is done by giving `uniroot()` an
interval to search for the answer. In order to ensure that all realistic
values and answers can be produced, I set an extremely large interval:
`c (-100000, 100000)`, or `c(0, 100000)` (for mass). I eliminated `delt`
from the original function so that this function can solve for `t1` or
`t0`.

``` r
source("../R/science.R")
newton2 <- function(f, m, a) {
  
  f1 <- function(x, m, a) x - m * a
  
  if(missing(f)) 
    return(uniroot(f1, c(-100000, 100000), m = m, a = a)$root)
  
  if(missing(m)) 
    return(uniroot(f1, c(0, 100000), x = f, a = a)$root)
  
  if(missing(a)) 
    return(uniroot(f1, c(-100000, 100000), x = f, m = m)$root)
}
newton2(f = 5, a = 3)
```

    ## [1] 1.666667
