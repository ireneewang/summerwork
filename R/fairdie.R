roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
} 
roll()

roll2 <- function() {
  die <- 1:6
  die2 <- sample(die, size = 1, replace = TRUE)
  die2
}
roll2()


roll2 <- function(times = 1) {
  die <- 1:6
  die2 <- sample(die, size = times, replace = TRUE)
  die2
}
set.seed(123)
roll2(times = 60)

tmp <- table(roll2(times = 60))

fair.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp),
                       expected = 10)

(fair.die$observed - fair.die$expected)/fair.die$expected

chisq.test(tmp)

set.seed(123)
roll2(times = 120)

tmp1 <- table(roll2(times = 120))

fair1.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp1),
                       expected = 20)

(fair1.die$observed - fair1.die$expected)/fair1.die$expected

chisq.test(tmp1)

set.seed(123)
roll2(times = 480)

tmp2 <- table(roll2(times = 480))

fair2.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp2),
                       expected = 80)

(fair2.die$observed - fair2.die$expected)/fair2.die$expected

chisq.test(tmp2)

set.seed(123)
roll2(times = 2400)

tmp3 <- table(roll2(times = 2400))

fair3.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp3),
                       expected = 400)

(fair3.die$observed - fair3.die$expected)/fair3.die$expected

chisq.test(tmp3)

set.seed(123)
roll2(times = 12000)

tmp4 <- table(roll2(times = 12000))

fair4.die <- data.frame(value = 1:6, 
                       observed = as.vector(tmp4),
                       expected = 2000)

(fair4.die$observed - fair4.die$expected)/fair4.die$expected

chisq.test(tmp4)