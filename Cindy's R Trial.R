library(tidyverse)
gapminder_data <- read_csv("gapminder_data.csv")

head(gapminder_data)

ggplot(gapminder_data) +
  aes(x= year, y=pop) +
  geom_point()+
  facet_wrap(vars(continent))

outliercounts <- gapminder_data %>% 
  filter(pop > 1e+09) %>% 
  select(country) %>% 
  unique()

gapminder_nouts <- gapminder_data %>% 
  filter(!country %in% outliercounts)

ggplot(gapminder_nouts) +
  aes(x= year, y=pop) +
  geom_point()+
  facet_wrap(vars(continent))

