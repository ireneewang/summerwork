# Final code

get_symbols <- function() {
  wheel <- c("dd", "7", "BBB", "BB", "B", "c", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(.03, .03, .06, .1, .25, .01, .52))
}

score <- function (symbols) {
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if(same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "c")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  # account for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}

play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}