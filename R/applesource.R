income <- read.csv("../data/appleannualincome.csv", header = TRUE, skip = 1, stringsAsFactors = FALSE)

# clean it up first
# filter to remove NA 
income <- income[!is.na(income$Fiscal.period), ]
# select Fiscal period and total revenues
income2 <- income[, c("Fiscal.period", "Total.Revenues")]

# convert Total revenue to numeric

income2$Total.Revenues <- as.numeric(gsub(",", "", income2$Total.Revenues))

income3 <- income[, c("Fiscal.period", "Gross.Profit")]
income3$Gross.Profit <- as.numeric(gsub(",", "", income3$Gross.Profit))

plot(x=income2$Fiscal.period, y = income2$Total.Revenues, type = "b")

plot(x=income3$Fiscal.period, y = income3$Gross.Profit, type = "b")
