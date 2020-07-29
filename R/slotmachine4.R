# previous work
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
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
  cherries <- sum(symbols == "C")
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
#not vectorized
abs_loop <- function(vec){
  for(i in 1:length(vec)){
    if(vec[i] <0) {
      vec[i] <- -vec[i]
    }
  }
  vec
}
#vs vectorized
abs_set <- function(vec){
  negs <- vec < 0
  vec[negs] <- vec[negs] * -1
  vec
}

#vectorize change symbols
vec[vec == "DD"]
vec[vec == "C"]
vec[vec == "7"]
#and so on

#application to the slot machine: loops and vectorized code
winnings <- vector(length = 1000000)
for (i in 1:1000000) {
  winnings[i] <- play()
}

mean(winnings)

get_many_symbols <- function(n) {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  vec <- sample(wheel, size = 3 * n, replace = TRUE,
                prob = c(.03, .03, .06, .1, .25, .01, .52))
  matrix(vec, ncol = 3)
}

play_many <- function(n) {
  symb_mat <- get_many_symbols(n = n)
  data.frame(w1 = symb_mat[,1], w2 = symb_mat[,2],
             w3 = symb_mat[,3], prize = score_many(symb_mat))
}

symbols <- matrix(
  c("DD", "DD", "DD",
    "C", "DD", "0",
    "B", "B", "B",
    "B", "BB", "BBB",
    "C", "C", "0",
    "7", "DD", "DD"), nrow = 6, byrow = TRUE)

score_many <- function(symbols) {
  cherries <- rowSums(symbols == "C")
  diamonds <- rowSums(symbols == "DD")
  prize <- c(0, 2, 5)[cherries + diamonds + 1]
  prize[!cherries] <- 0
  
  same <- symbols[, 1] == symbols[, 2] &
    symbols[, 2] == symbols[, 3]
  payoffs <- c("DD" = 100, "7" = 80, "BBB" = 40, 
               "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize[same] <- payoffs[symbols[same, 1]]
  
  bars <- symbols == "B" | symbols == "BB" | symbols == "BBB"
  all_bars <- bars[, 1] & bars[, 2] & bars[, 3] & !same
  prize[all_bars] <- 5
  
  two_wilds <- diamonds == 2
  
  one <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 2] == symbols[, 3]
  two <- two_wilds & symbols[, 1] != symbols[, 2] &
    symbols[, 1] == symbols[, 3]
  three <- two_wilds & symbols[, 1] == symbols[, 2] &
    symbols[, 2] != symbols[, 3]
  
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]
  
  one_wild <- diamonds == 1
  
  wild_bars <- one_wild & (rowSums(bars) == 2)
  prize[wild_bars] <- 5
  
  one <- one_wild & symbols[, 1] == symbols[, 2]
  two <- one_wild & symbols[, 2] == symbols[, 3]
  three <- one_wild & symbols[, 3] == symbols[, 1]
  prize[one] <- payoffs[symbols[one, 1]]
  prize[two] <- payoffs[symbols[two, 2]]
  prize[three] <- payoffs[symbols[three, 3]]
  
  unname(prize * 2^diamonds)
}