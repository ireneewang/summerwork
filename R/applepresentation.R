# plots
library(ggplot2)
income <- read.csv("../data/appleannualincome.csv", header = TRUE, skip = 1, stringsAsFactors = FALSE)

income <- income[!is.na(income$Fiscal.period), ]

income2 <- income[, c("Fiscal.period", "Total.Revenues")]
income2$Total.Revenues <- as.numeric(gsub(",", "", income2$Total.Revenues))

income3 <- income[, c("Fiscal.period", "Gross.Profit")]
income3$Gross.Profit <- as.numeric(gsub(",", "", income3$Gross.Profit))

gg_plot1 <- ggplot(data = income2, mapping = aes(x = Fiscal.period, y = Total.Revenues, color = Total.Revenues)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Total.Revenues)) +
  labs(title = "Apple Total Revenues Linear Regression", x = "Year", y = "Total Revenues (dollars)", color = "Total Revenues")

gg_plot2 <- ggplot(data = income3, mapping = aes(x = Fiscal.period, y = Gross.Profit, color = Gross.Profit)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Gross.Profit)) +
  labs(title = "Apple Gross Profit Linear Regression", x = "Year", y = "Gross Profit (dollars)", color = "Gross Profit")

gg_plot3 <- ggplot(income2, aes(x = Fiscal.period, y = Total.Revenues)) +
  geom_bar(stat = "identity", color = "blue", fill = rgb(0.2,0.6,0.8,0.7)) +
  labs(title = "Apple Total Revenues Bar Plot", x = "Year", y = "Total Revenues (dollars)")

gg_plot4 <- ggplot(income3, aes(x = Fiscal.period, y = Gross.Profit)) +
  geom_bar(stat = "identity", color = "purple", fill = rgb(.6, .6, 1, .7)) +
  labs(title = "Apple Gross Profit Bar Plot", x = "Year", y = "Gross Profit (dollars)")

gg_plot5 <- ggplot(data = income2, mapping = aes(x = Fiscal.period, y = Total.Revenues, color = Fiscal.period > 2012)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Total.Revenues)) +
  labs(title = "Apple Total Revenues Linear Regression Split", x = "Year", y = "Total Revenues (dollars)", color = "Total Revenues by Time")

gg_plot6 <- ggplot(data = income3, mapping = aes(x = Fiscal.period, y = Gross.Profit, color = Fiscal.period > 2012)) +
  scale_shape_identity() +
  geom_point(size = 3) + 
  geom_smooth(method = "lm", aes(fill = Gross.Profit)) +
  labs(title = "Apple Gross Profit Linear Regression Split", x = "Year", y = "Gross Profit (dollars)", color = "Gross Profit by Time")

# ppt
library(officer)
apple_pres <- read_pptx()

apple_pres <- add_slide(apple_pres, layout = "Title Slide", master = "Office Theme")
apple_pres <- ph_with(apple_pres, value = "Apple Presentation", location = ph_location_type(type = "ctrTitle"))
apple_pres <- ph_with(apple_pres, value = "By Irene Wang", location = ph_location_type(type = "subTitle"))

apple_pres <- add_slide(apple_pres, layout = "Title and Content", master = "Office Theme")
apple_pres <- ph_with(apple_pres, value = "Foreword", location = ph_location_type(type = "title"))
apple_pres <- ph_with(apple_pres,
                      value = "This powerpoint is designed to present the graphs and analysis of Apple's total revenues and gross income.
                      Using ggplot2, I produced aesthetic, statistical plots of Apple's data from 2005 - present time.", 
                      location = ph_location_type(type = "body"))

apple_pres <- add_slide(apple_pres)
apple_pres <- ph_with(x = apple_pres, value = gg_plot1, location = ph_location_fullsize())

apple_pres <- add_slide(apple_pres)
apple_pres <- ph_with(x = apple_pres, value = gg_plot2, location = ph_location_fullsize())


apple_pres <- add_slide(apple_pres, layout = "Title and Content", master = "Office Theme")
apple_pres <- ph_with(apple_pres, value = "Linear Regressions Analysis", location = ph_location_type(type = "title"))
apple_pres <- ph_with(apple_pres,
                      value = "Both plots graph the linear regression of the Apple data.
                      The data seems to grow exponentially up until 2012, where it oscillates around a linear line. 
                      However, from a larger scope, it becomes apparent that the data is relatively linear and that the regression line represents the data well. 
                      This indicates that the correlation coefficient is most likely positive and close to 1. 
                      The coefficient of determination also most likely is close to one, as a high percentage of data can be accounted for by the line of regression:
                      looking at the shaded region, only a few points do not fall within the area (this is the 95% confidence interval).", 
                      location = ph_location_type(type = "body"))

apple_pres <- add_slide(apple_pres)
apple_pres <- ph_with(x = apple_pres, value = gg_plot3, location = ph_location_fullsize())

apple_pres <- add_slide(apple_pres)
apple_pres <- ph_with(x = apple_pres, value = gg_plot4, location = ph_location_fullsize())

apple_pres <- add_slide(apple_pres, layout = "Title and Content", master = "Office Theme")
apple_pres <- ph_with(apple_pres, value = "Bar Plots Analysis", location = ph_location_type(type = "title"))
apple_pres <- ph_with(apple_pres,
                      value = "This first bar plot graphs total revenues against fiscal period, and the second graphs gross profit. 
                      The trend is, obviously, the same as with the scatter plots.
                      These plots serve the purpose of just another method for analysis, as well as for an aesthetically pleasing image.", 
                      location = ph_location_type(type = "body"))

apple_pres <- add_slide(apple_pres)
apple_pres <- ph_with(x = apple_pres, value = gg_plot5, location = ph_location_fullsize())

apple_pres <- add_slide(apple_pres)
apple_pres <- ph_with(x = apple_pres, value = gg_plot6, location = ph_location_fullsize())

apple_pres <- add_slide(apple_pres, layout = "Title and Content", master = "Office Theme")
apple_pres <- ph_with(apple_pres, value = "Linear Regressions Split Analysis", location = ph_location_type(type = "title"))
apple_pres <- ph_with(apple_pres,
                      value = "These plots address the seemingly exponential then linear growth of the data.
                      Though the data before 2012 appears to grow exponentially in comparison to the data after, the overall growth seems to be about the same. 
                      Looking at the slope closely, the growth is steeper for data before 2012; however, this difference is very minimal.", 
                      location = ph_location_type(type = "body"))

print(apple_pres, target = "../apple_pres.pptx")


