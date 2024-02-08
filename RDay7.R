
library(tidyverse)
u.gm <- "https://www.finley-lab.com/files/data/gapminder.tsv"

gm <- read.delim(u.gm)
class(gm)
gm <- as_tibble(gm)


### mutate()

g2 <- gm %>% 
  group_by(country) %>%
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(pop, gdpPercap))

View(g2)

g3 <-gm %>% 
  group_by(country) %>% 
  mutate(changeLifeExp = lifeExp - lag(lifeExp, order_by = year)) %>% 
  select(-c(pop, gdpPercap)) %>% 
  summarize(largestDropLifeExp = min(changeLifeExp, na.rm = TRUE))

View(g3)


#### stringr ###

x <- " CdacNoidaSector62 "

str_to_lower(x)

str_to_upper(x)

str_c("x", "y")
paste("x","y")

str_c("x", "y", "z")

str_c("x", "y", "z","e")

y <- c("Apple", "Banana", "Pear")

str_sub(y, 1, 3)


CID <- str_sub(gm$country, 1,4)
CID

str_length(x)

str_trim(x,side = "both")
str_trim(x,side = "left")













