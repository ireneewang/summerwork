roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
} 
roll()

newton1 <- function(m, a) {
  f = m * a 
  f
}
newton1(m = 5, a = 3)

chemistry1 <- function(m, c, t1, t0) { 
  delt = t1 - t0
  q = m * c * delt
  q
}
chemistry1(m = 1, c = 4.2, t1 = 70, t0 = 30)