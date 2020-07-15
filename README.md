## Summer Work
### Irene Wang
#### This is my project/any work that took place over the summer of 2020 as an intern, and I'm utilizing GitHub as a way to track and demonstrate by progress. Everything is virtually self taught.

**7/6/20:first.R**: My first script starts with 3 simple functions. First, I simulated the rolling of a pair of dice and the computation of their sum by writing a function dubbed `roll()`. This was executed using `sample()`. The next two functions essentially follow the same format. I took equations from my science classes in school and wrote them as functions. The gist of these two functions is that given the input values, it can calculate the result by following the given equation.
```R
source("first.R")
# roll a die
roll()
# 
```
**7/7/20:Science.R**: This script is an expansion on the science equations in first.R. By utilizing the `uniroot()` function, my code can calculate any missing variable in the equation, given that the other parameters are inputed. This is done by giving `uniroot()` an interval to search for the answer. In order to ensure that all realistic values and answers can be produced, I set an extremely large interval: `c (-100000, 100000)`, or `c(0, 100000)` (for mass). I eliminated `delt` from the original function so that this function can solve for `t1` or `t0`.

**7/8/20:fairdie.R**: This script is an expansion on the dice simulation in first.R. I slightly rewrote `roll()` into `roll2()` in order to simulate the rolling of one singular die. From there, I utilized `set.seed()` in order to reproduce "random" results (it's not truly random, however, because a computer can't produce random figures). 

From there, I replicated the rolling of a die 60 times and constructed a table using `data.frame()`. Using the equation for margin of error, (O-E)/E, I can estimate the "fairness" of the die. I then repeated this with different sample sizes: 120, 480, 2400, 12000 rolls and compared results. The practice of statistics tells me that as sample size increases, the observed results get closer and closer to the expected results because the margin of error gets smaller and smaller. 

A chi-squared test, `chisq.test()`, can test if the die is fair by checking it with a p-value = .05 for $\alpha$. Thus, rolling the die 60 times leads to a rejection of the null hypothesis (which is that the die is fair), but for the other rolls of a larger sample size, you would fail to reject the null, meaning the die does appear to be fair. 
`chisq.test(fair4.die$observed, p = rep(1/6, 6))` executes the chi-squared test; however, `chisq.test(tmp4)` does the same thing.

**7/9/20:part2.R**: In part 2, I explore different R Objects in order to build a deck of cards. I learn to use matrices, arrays, and data frames which consist of vectors. In the code, I messed around with the `dim()` function which sets dimensions. Next, I fit `die` into a matrix. `byrow = TRUE` lets the matrix fill the data rather by column (which is defalt). Next, I made a three dimensional array with the dimensions 2x2x3. I then started exploring ways to construct the deck of cards by looking at lists, which then later evolved into data frames. The list `card <- list("ace", "hearts", 1)` could be copied 52 times to produce a deck of cards; however, a data frame is much more clean and efficient. The last line is a saved file on my computer than produces a data frame of three different columns that sort 52 rows for the 52 cards in a deck. The throw columns are the face, suit, and value of each card respectively.

In deck1.R, I explore ways to "shuffle" the deck. The function `deal()` produces the top card in the deck. To produce a new card with `deal()`, the deck needs to be shuffled. A "random" card can be produced with the `sample()` function, which is employed into my `shuffle()` function. A new card can be delt by rerunning 
```R
deck2 <- shuffle(deck)

deal(deck2)
```
The deck data is located in a separate folder called "data"; the document was provided by Garrett Grolemund in the book "Hands-On Programming with R".

**7/10/20:appleincome.R**: I downloaded an excel file on Apple's income statement from 2005 - present time from https://advisortools.zacks.com/Research/Stocks/AAPL/Financials, and edited it on excel by flipping columns and rows. I then uploaded it as a .csv file into R, where I cleaned up the chart by removing the commas from the numbers in order to make the data numeric and removed any N/A lines. I then used the `plot()` and `ggplot()` functions to produced graphs on Apple's total revenue and gross profit.

**7/14/20:deck2.r8**: In an expansion on deck1.R, I modified the values of the deck depending on the game being played. For example, in a game of war, the ace values are actually greater than that of the King, making the value go from 1 to 14. Since aces appear every 13 in this deck, I can replace the vector with the appropriate value. Next, I demonstrated how the use of logical operators can be used to identify cards in a shuffled deck. The logical operator will produce `FALSE` for cards that aren't aces and `TRUE` for cards that are. Next, I used a Boolean operator to locate a specific card in the deck with the `&` symbol. This can lead to, once again, a modification of card values appropriate for the game that is being played.
