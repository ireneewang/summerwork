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

    ## [1] "0"  "B"  "BB"

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

    ## [1] "0" "B" "0"

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

    ## [1] "dd" "0"  "0"

``` r
print.slots <- function(x, ...) {
  slot_display(x)
}
one_play
```

    ## B 0 B
    ## $0
