Slot Machine
================

## First

[**7/23/20:slotmachine1.R**](../R/slotmachine1.R): First, I wrote a
function to generate 3 symbols to simulate the rolling of a slot
matchine: `get_symbols()`, which contains the list `wheel()`, by using
the `sample()` function. The next segment is a frame for how the slot
machine will operate through the use of if, else if, and else functions.
The `same()` function checks for a row of three. The next part deals
with the rolling of bars with `else if`. Then, I wrote code on how these
two would be given payout. The next segment is dealing with rolling of
“C”, otherwise known as cherries in a casino. The final part is
dealing with the rolling of diamonds, which can double the prize.

``` r
source("../R/slotmachinefinal.R")
play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}
play()
```

    ## [1] "0" "0" "0"

    ## [1] 0

## Second

[**7/24/20:slotmachine2.R**](../R/slotmachine2.R): The purpose of this
is to delve deeper into the slot machine script produced in
slotmachine1.R. First, I worked with attributes by assigning one\_play a
vector. Attributes is meant to make the play function less redundant; I
removed the `print()` function. I then wrote a new function to display
slot results, `slot_display()`. The last line in the function,
`cat(string)` will replace `\n` with a new line. Essentially,
`slot_display()` will clean up the output, tidying it up.

``` r
source("../R/slotmachine2.R")
```

    ## [1] "BBB" "0"   "BB"

``` r
slot_display <- function(prize) {
  symbols <- attr(one_play, "symbols")
  symbols <- paste(symbols, collapse = " ")
  prize <- one_play
  string <- paste(symbols, prize, sep = "\n$")
  cat(string)
}
slot_display(play())
```

    ## B 0 B
    ## $0

I then worked with a new print method to modify `one_play` to do what
`slot_display()` did.

``` r
source("../R/slotmachine2.R")
```

    ## [1] "BBB" "B"   "BB"

``` r
print.slots <- function(x, ...) {
  slot_display(x)
}
one_play
```

    ## B 0 B
    ## $5

## Third

[**7/28/20:slotmachine3.R**](../R/slotmachine3.R): The purpose of this
is to utilize the `score()` function I wrote before and apply it to
realistic scenarios through statistics. I first used `expand.grid` to
construct a data frame. I then added probabilites of Var 2, 3, and 3 as
combos to columns. Using the application of statistics, I calculated the
probability of every possible combination of the slot machine. Summing
up these probabilities produces the expected 1. Then, through the use of
loops, I can calculate the prize of every combination. Loops utilize
`for()` to execute code. Then, finally, I calculated the expected value
of the prize.

``` r
source("../R/slotmachine3.R")
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)

prob <- c("DD" = .03, "7" = .03, "BBB" = .06, "BB" = .1, "B" = .25, "C" = .01, "0" = .52)

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

head(combos, 3)
```

    ##   Var1 Var2 Var3 prob1 prob2 prob3
    ## 1   DD   DD   DD  0.03  0.03  0.03
    ## 2    7   DD   DD  0.03  0.03  0.03
    ## 3  BBB   DD   DD  0.06  0.03  0.03

## Fourth

[**7/29/20:slotmachine4.R**](../R/slotmachine4.R): This final section of
the book introduces how to write code quickly, which is then used to
simulate 10 million slot machine plays. I incorporated vectorized code
and quick loops to carry out this task. s
