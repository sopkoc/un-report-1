library(tidyverse)
gapminder_data <- read_csv("data/gapminder_data.csv")

summarize(gapminder_data, averagelifeExp = mean(lifeExp))

#Piping dataset- lets you chain together multiple commands
gapminder_data %>% summarize(averagelifeExp = mean(lifeExp))

gapminder_data %>% 
  summarize(averagelifeExp = mean(lifeExp))

# %>% 
#Shift + command + m
  
gapminder_data_summarized <- gapminder_data %>% summarize(averagelifeExp = mean(lifeExp))

# danger! will replace all gapminder_data with the averagelifeExp
gapminder_data <- gapminder_data %>% summarize(averagelifeExp = mean(lifeExp))

gapminder_data %>% 
  summarize(recent_year = max(year))

#Get average life expectancy for the year 2007
gapminder_data %>% 
  filter(year == 2007) %>% 
  summarize (average = mean(lifeExp))

#Average GDP per capita for the first year in the dataset


# > gapminder_data %>% 
#      first_year = summarize(year1 = min(year)) %>% 
#      filter(year == first_year) %>% 
#      summarize (average = mean(gdpPerCap))

gapminder_data %>% 
  filter(year == min(year)) %>% 
  summarize(average = mean(gdpPercap))

gapminder_data %>% 
  group_by(year) %>% 
  summarize(average = mean(lifeExp))

#calculate average life expectancy by continent
gapminder_data %>% 
  group_by(continent) %>% 
  summarize(average = mean(lifeExp))

gapminder_data %>% 
  group_by(continent) %>% 
  summarize(average = mean(lifeExp), min = min(lifeExp))

#mutate(), function to create new columns
gapminder_data %>% 
  mutate(gdp = pop * gdpPercap)

gapminder_data %>% 
  mutate(gdp = pop * gdpPercap, popInMillions = pop/1000000)

#select()

gapminder_data %>% 
  select(pop, year)

#Remove continent column 
gapminder_data %>% 
  select(-continent)

#get a data frame that has only the columns country, continent, year, and lifeExp

gapminder_data %>% 
  select(-pop, -gdpPercap)

gapminder_data %>% 
  select(year, starts_with('c'))

gapminder_data %>% 
  select(ends_with('p'))

?select #opens help window for select

gapminder_data %>% 
  select(year, starts_with("con"))

gapminder_data %>% 
  select(country, continent, year, lifeExp) %>% 
  pivot_wider(names_from = year, values_from = lifeExp)

#new dataset

gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>% 
  filter (year == 2007 & continent == "Americas") %>% 
  select(-year, -continent)

temp <- read_csv("co2-un-data.csv")

read_csv("co2-un-data.csv", skip = 1)

co2_emissions_dirty <- read_csv("co2-un-data.csv", skip = 2, 
                                col_names = c("region", "country", "year", 
                                              "series", "value", "footnotes", 
                                              "source"))
co2_emissions_dirty

read_csv("co2-un-data.csv", skip =1) %>% 
  rename (country = ...2)

co2_emissions_dirty %>% 
  select(country,year,series,value)

co2_emissions_dirty %>% 
  select(country,year,series,value) %>% 
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = value) %>% 
  count(year)

#filter out data for just 2005 and drop out the year column
co2_emissions <- co2_emissions_dirty %>% 
  select(country,year,series,value) %>% 
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = value) %>% 
  filter(year==2005) %>% 
  select(-year)
  
inner_join(gapminder_data, co2_emissions)

inner_join(gapminder_data, co2_emissions, by = 'country')

gapminder_co2 <- inner_join(gapminder_data_2007, co2_emissions, by = 'country')

