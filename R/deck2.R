setwd("../SummerWork/")
deck <- read.csv("data/deck.csv", stringsAsFactors = FALSE)

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

deck3 <- deck

deck3$value[c(13, 26, 39, 52)] <- 14

1 > 2 #logical operators

deck2$face
deck2$face == "ace"

deck4 <- deck

deck4$face == "queen" & deck4$suit == "spades"
queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades"

deck4[queenOfSpades, ]
deck4$value[queenOfSpades] <- 13 #modification to play the game Hearts
