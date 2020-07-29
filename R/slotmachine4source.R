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