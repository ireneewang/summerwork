library(BatchGetSymbols)
library(ggplot2)

# set dates
first.date <- Sys.Date() - 5475
last.date <- Sys.Date()
freq.data <- "yearly"

# set tickers
tickers <- c("AAPL", "WMT")

l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
                         last.date = last.date, 
                         freq.data = freq.data,
                         cache.folder = file.path(tempdir(), 
                                                  'BGS_Cache') )

print(l.out$df.control)

p <- ggplot(l.out$df.tickers, aes(x = ref.date, y = price.close))
p <- p + geom_line()
p <- p + facet_wrap(~ticker, scales = 'free_y') 
print(p)

#facebook
first.date2 <- Sys.Date() - 3650
last.date2 <- Sys.Date()
freq.data2 <- "yearly"

tickers2 <- c("FB")

l.out2 <- BatchGetSymbols(tickers = tickers2, 
                         first.date = first.date2,
                         last.date = last.date2, 
                         freq.data = freq.data2,
                         cache.folder = file.path(tempdir(), 
                                                  'BGS_Cache') )

print(l.out2$df.control)

q <- ggplot(l.out2$df.tickers, aes(x = ref.date, y = price.close))
q <- q + geom_line()
q <- q + facet_wrap(~ticker, scales = 'free_y') 
print(q)