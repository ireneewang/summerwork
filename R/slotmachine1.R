get_symbols <- function() {
  wheel <- c("dd", "7", "BBB", "BB", "B", "c", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(.03, .03, .06, .1, .25, .01, .52))
}

if( # Case 1: all the same) {
  prize <- # look up the prize
} else if ( # case 2: all bars) {
  prize <- # assign $5
} else {
  # count cherries
  prize <- # calculate a prize
}
# count diamonds
# double the prize if necessary

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]

if(same) {
  prize <- #look up prize
} else if ( # case 2: all bars) {
  prize <- # assign $5
} else {
    # count cherries
    prize <- # calculate a prize
}
# count diamonds
# double the prize if necessary

bars <- symbols %in% c("B", "BB", "BBB")

if(same) {
  prize <- #look up prize
} else if (all(bars)) {
  prize <- # assign $5
} else {
    # count cherries
    prize <- # calculate a prize
}
# count diamonds
# double the prize if necessary

payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)

if(same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  # count cherries
  prize <- # calculate a prize
}
# count diamonds
# double the prize if necessary

sum(symbols == "c")
sum(symbols == "DD")

if(same) {
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  prize <- 5
} else {
  cherries <- sum(symbols == "c")
  prize <- # calculate a prize
}
diamonds <- sum(symbols == "DD")
# double the prize if necessary

if (cherries == 2) {
  prize <-5
} else if (cherries == 1){
  prize <- 2
} else {
prize <- 0
}
# One way to distribute prizes for cherries, but there is a simpler method.

prize <- c(0, 2, 5)[cherries + 1]

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
# double the prize if necessary

prize * 2 ^ diamonds
# doubling the prize

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

# Final code

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