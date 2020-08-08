library(BatchGetSymbols)
library(ggplot2)

# set dates
first.date <- Sys.Date() - 5475
last.date <- Sys.Date()
freq.data <- "yearly"

# set tickers
tickers <- c("AAPL", "FB", "WMT")

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