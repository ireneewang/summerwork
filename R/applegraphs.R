income <- read.csv("../data/appleannualincome.csv", header = TRUE, skip = 1, stringsAsFactors = FALSE)

income <- income[!is.na(income$Fiscal.period), ]

income2 <- income[, c("Fiscal.period", "Total.Revenues")]
income2$Total.Revenues <- as.numeric(gsub(",", "", income2$Total.Revenues))

library(ggplot2)


ggplot(data = income2, mapping = aes(x = Fiscal.period, y = Total.Revenues, color = factor(Total.Revenues))) +
  geom_point(size = 3) + 
  labs(title = "Apple Total Revenues Scatter Plot", x = "Year", y = "Total Revenues (dollars)", color = "Total Revenues")

ggplot(data = income2, mapping = aes(x = Fiscal.period, y = Total.Revenues, color = Total.Revenues)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Total.Revenues)) +
  labs(title = "Apple Total Revenues Linear Regression", x = "Year", y = "Total Revenues (dollars)", color = "Total Revenues")


income3 <- income[, c("Fiscal.period", "Gross.Profit")]
income3$Gross.Profit <- as.numeric(gsub(",", "", income3$Gross.Profit))

ggplot(data = income3, mapping = aes(x = Fiscal.period, y = Gross.Profit, color = factor(Gross.Profit))) +
  geom_point(size = 3) +
  labs(title = "Apple Gross Profit Scatter Plot", x = "Year", y = "Gross Profit (dollars)", color = "Gross Profit")

ggplot(data = income3, mapping = aes(x = Fiscal.period, y = Gross.Profit, color = Gross.Profit)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Gross.Profit)) +
  labs(title = "Apple Gross Profit Linear Regression", x = "Year", y = "Gross Profit (dollars)", color = "Gross Profit")