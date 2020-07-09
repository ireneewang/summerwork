deck <- read.csv("../data/deck.csv")

deal <- function(cards){
  cards[1, ]
}

random <- sample(1:52, size = 52)

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

deal(deck)

deck2 <- shuffle(deck)

deal(deck2)