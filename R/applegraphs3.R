income <- read.csv("../data/appleannualincome.csv", header = TRUE, skip = 1, stringsAsFactors = FALSE)

income <- income[!is.na(income$Fiscal.period), ]

income2 <- income[, c("Fiscal.period", "Total.Revenues")]
income2$Total.Revenues <- as.numeric(gsub(",", "", income2$Total.Revenues))

income2$log10_Total.Revenues = log10(income2$Total.Revenues)

library(ggplot2)

ggplot(data = income2, mapping = aes(x = Fiscal.period, y = log10_Total.Revenues, color = Fiscal.period > 2012)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Total.Revenues)) +
  labs(title = "Apple Total Revenues Linear Regression Split", x = "Year", y = "Total Revenues (dollars)", color = "Total Revenues by Time")


income3 <- income[, c("Fiscal.period", "Gross.Profit")]
income3$Gross.Profit <- as.numeric(gsub(",", "", income3$Gross.Profit))

income3$log10_Gross.Profit = log10(income3$Gross.Profit)

ggplot(data = income3, mapping = aes(x = Fiscal.period, y = log10_Gross.Profit, color = Fiscal.period > 2012)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Gross.Profit)) +
  labs(title = "Apple Gross Profit Linear Regression Split", x = "Year", y = "Gross Profit (dollars)", color = "Gross Profit by Time")