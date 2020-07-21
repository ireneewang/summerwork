income <- read.csv("../data/appleannualincome.csv", header = TRUE, skip = 1, stringsAsFactors = FALSE)

# clean it up first
# filter to remove NA 
income <- income[!is.na(income$Fiscal.period), ]
# select Fiscal period and total revenues
income2 <- income[, c("Fiscal.period", "Total.Revenues")]

# convert Total revenuew to numeric
library(ggplot2)

income2$Total.Revenues <- as.numeric(gsub(",", "", income2$Total.Revenues))

plot(x=income2$Fiscal.period, y = income2$Total.Revenues, type = "b")

plot(x=income2$Fiscal.period, y = income2$Total.Revenues, type = "h")

plot(x=income2$Fiscal.period, y = income2$Gross.Profit, type = "b")

plot(x=income2$Fiscal.period, y = income2$Gross.Profit, type = "h")

ggplot(data = income2, mapping = aes(x = Fiscal.period, y = as.numeric(Total.Revenues))) + geom_point()
