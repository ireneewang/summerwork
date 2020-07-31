income <- read.csv("../data/appleannualincome.csv", header = TRUE, skip = 1, stringsAsFactors = FALSE)

income <- income[!is.na(income$Fiscal.period), ]

income2 <- income[, c("Fiscal.period", "Total.Revenues")]
income2$Total.Revenues <- as.numeric(gsub(",", "", income2$Total.Revenues))

income3 <- income[, c("Fiscal.period", "Gross.Profit")]
income3$Gross.Profit <- as.numeric(gsub(",", "", income3$Gross.Profit))

library(ggplot2)

p <- ggplot(data = income2, mapping = aes(x = Fiscal.period, y = Total.Revenues, color = factor(Total.Revenues))) +
  geom_point(size = 3)

p + scale_x_log10() + scale_y_log10()

q <- ggplot(data = income3, mapping = aes(x = Fiscal.period, y = Gross.Profit, color = factor(Gross.Profit))) +
  geom_point(size = 3)

q + scale_x_log10() + scale_y_log10()


ggplot(income2, aes(x = Fiscal.period, y = Total.Revenues)) +
  geom_bar(stat = "identity", color = "blue", fill = rgb(0.2,0.6,0.8,0.7))

ggplot(income3, aes(x = Fiscal.period, y = Gross.Profit)) +
  geom_bar(stat = "identity", color = "purple", fill = rgb(.6, .6, 1, .7))