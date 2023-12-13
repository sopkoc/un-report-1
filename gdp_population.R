#Script to analyze relationship between GDP and Life Expectancy
library(tidyverse)
gapminder_1997 <- read_csv("gapminder_1997.csv")
View(gapminder_data)
name <- "Ben"
name
age <- 26
age
name <- "Harry Potter"
name
test <- read_csv("gapminder_1997.csv")
Sys.Date() #outputs the current date, used for knowing when I last ran
getwd() #output current directory

sum(5,6) #adds numbers
round(3.1415, 2)

read_csv(file = 'gapminder_1997.csv')

ggplot(data=gapminder_1997) + 
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y="Life Expectancy") +
  geom_point() + 
  labs(title = "Do people in wealthy countries live longer?") +
  aes (color = continent) + 
  scale_color_brewer(palette = "Set1") + 
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)") +
  aes(shape = continent)

#Same code as previous, just streamlined.
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000, shape = continent) + 
  #Don't need to x= and y=, ggplot will already assign it to those axes for the first 2 variables
  geom_point() + 
  scale_color_brewer(palette = "Set1") +
  labs (x = "GDP Per Capita", y = "Life Expectancy", 
        title = "Do people in wealthy countries live longer?", size = "Population (in millions)")

gapminder_data <- read_csv("gapminder_data.csv")

dim(gapminder_data)
head(gapminder_data) #gives first 6 rows of dataset

#Define the data (as gapminder_data), using aes define year as x axis, life expectancy as y, ...
#continent as aesthetic color, point to display

ggplot(data=gapminder_data) +
  aes(year, lifeExp, color = continent) +
  geom_point()
