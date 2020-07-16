roll <- function() {
  die <- 1:6
  die2 <- sample(die, size = 1, replace = TRUE,
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
}

roll()

roll <- function(times = 1) {
  die <- 1:6
  die2 <- sample(die, size = times, replace = TRUE,
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  die2
}
set.seed(123)
roll(times = 12000)

tmp <- table(roll(times = 12000))

biased.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp),
                       expected = 2000)

(biased.die$observed - biased.die$expected)/biased.die$expected

chisq.test(tmp)