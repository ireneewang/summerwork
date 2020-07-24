# previous work
get_symbols <- function() {
  wheel <- c("dd", "7", "BBB", "BB", "B", "c", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(.03, .03, .06, .1, .25, .01, .52))
}

score <- function (symbols) {

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
 bars <- symbols %in% c("B", "BB", "BBB")
  

if(same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "c")
  prize <- c(0, 2, 5)[cherries + 1]
}

diamonds <- sum(symbols == "DD")
prize * 2 ^ diamonds
}

play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}
#new work
one_play <- play()
attributes(one_play)

attr(one_play, "symbols") <- c("B", "0", "B")

two_play <- function() {
  symbols <- get_symbols()
  prize <- score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}

three_play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}

slot_display <- function(prize) {
  symbols <- attr(one_play, "symbols")
  symbols <- paste(symbols, collapse = " ")
  prize <- one_play
  string <- paste(symbols, prize, sep = "\n$")
  cat(string)
}

class(one_play) <- "slots"
args(print)
print.slots <- function(x, ...) {
  cat("I'm using the print.slots method")
}

print.slots <- function(x, ...) {
  slot_display(x) 
}
one_play