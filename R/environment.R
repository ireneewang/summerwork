deck <- read.csv("../data/deck.csv", stringsAsFactors = FALSE)

as.environment("package:stats") #This function allows you to refer to any environments in your tree.

globalenv() 
baseenv()
emptyenv()
# These functions are used to refer to the accessor functions in the environment tree.

parent.env(globalenv()) #Look up an environment's parent.

ls(emptyenv()) #Used to view objects saved in an environment

head(globalenv()$deck, 3) #Access deck from the global environment.

show_env <- function(){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment)))
}
# This function explores R's runtime environments.

deal <- function() {
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}
#Deal now cleans up the global copy of deck, like in real life.

shuffle <- function(cards){
  random <- sample(1:52, size = 52)
  cards[random, ]
}