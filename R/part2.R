die <- c(1, 2, 3, 4, 5, 6)

dim(die) <- c(2, 3)
dim(die) <- c(3, 2)
dim(die) <- c(1, 2, 3)

m <- matrix(die, nrow = 2)
m2 <- matrix(die, nrow = 2, byrow = TRUE)

ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))

card <- list("ace", "hearts", 1)

deck <- read.csv("~/RProjects/deck.csv")