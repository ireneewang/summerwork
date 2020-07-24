Slot Machine
================

## First

**7/23/20:slotmachine1.R**: First, I wrote a function to generate 3
symbols to simulate the rolling of a slot matchine: `get_symbols()`,
which contains the list `wheel()`, by using the `sample()` function. The
next segment is a frame for how the slot machine will operate through
the use of if, else if, and else functions. The `same()` function checks
for a row of three. The next part deals with the rolling of bars with
`else if`. Then, I wrote code on how these two would be given payout.
The next segment is dealing with rolling of “C”, otherwise known as
cherries in a casino. The final part is dealing with the rolling of
diamonds, which can double the prize.

``` r
source("../R/slotmachinefinal.R")
play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}
play()
```

    ## [1] "0" "B" "0"

    ## [1] 0
