
#### PROBABILITY DISTRIBUTION ####

### Normal Distribution

z<-seq(-3.5,3.5,0.1)  # 71 points from -3.5 to 3.5 in 0.1 steps
q<-seq(0.001,0.999,0.001)  # 1999 points from 0.1% to 99.9% on 0.1% steps

dStandardNormal <- data.frame(Z=z, 
                              Density=dnorm(z, mean=0, sd=1),
                              Distribution=pnorm(z, mean=0, sd=1))  

qStandardNormal <- data.frame(Q=q, 
                              Quantile=qnorm(q, mean=0, sd=1))  
head(dStandardNormal)
head(qStandardNormal)

# plots

library(ggplot2)
# geom_path() : to plot the distribution of the variable as a continous line


ggplot(data = dStandardNormal,
       aes(x= Z, y = Density)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "Z", breaks = seq(-3.5,3.5, by = 0.5)) +
  scale_y_continuous(name = "Density") +
  ggtitle("Standard Normal Density (mean = 0, sd = 1)")

ggplot(data = dStandardNormal,
       aes(x= Z, y = Distribution)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "Z", breaks = seq(-3.5,3.5, by = 0.5)) +
  scale_y_continuous(name = "Distribution") +
  ggtitle("Standard Normal Distribution (mean = 0, sd = 1)")


ggplot(data = qStandardNormal,aes(x= Q, y = Quantile)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "Q", breaks = seq(0,1, by = 0.1)) +
  scale_y_continuous(name = "Quantile") +
  ggtitle("Standard Normal Quantile (mean = 0, sd = 1)")


### Poison Distribution

lower <- qpois(0.001, lambda=2.5)
upper <- qpois(0.999, lambda=2,5)
n<-seq(lower,upper,1)

q<-seq(0.001,0.999,0.001)

dPoisson25 <- data.frame(N=n, 
                         Density=dpois(n, lambda=2.5),
                         Distribution=ppois(n, lambda=2.5))  

qPoisson25 <- data.frame(Q=q, Quantile=qpois(q, lambda=2.5))  

head(dPoisson25)
head(qPoisson25)

# plots

ggplot(data = dPoisson25,
       aes(x= N, y = Density)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "N", breaks = seq(0,8, by = 1)) +
  scale_y_continuous(name = "Density") +
  ggtitle("Poison Density (lambda = 2.5)")

ggplot(data = dPoisson25,
       aes(x= N, y = Distribution)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "N", breaks = seq(0,8, by = 1)) +
  scale_y_continuous(name = "Distribution") +
  ggtitle("Poison Distribution (lambda = 2.5)")


ggplot(data = qPoisson25,
       aes(x= Q, y = Quantile)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "Q", breaks = seq(0,1, by = 0.1)) +
  scale_y_continuous(name = "Quantile") +
  ggtitle("Poison Quantile (lambda = 2.5)")


### Binomial Distribution

lower <- qbinom(0.001, size=100, prob=0.5)
upper <- qbinom(0.999, size=100, prob=0.5)

n <- seq(lower,upper,1)

q<-seq(0.001,0.999,0.001)

dBinom100 <- data.frame(N=n, 
                        Density=dbinom(n, size=100, prob=0.5),
                        Distribution=pbinom(n, size=100, prob=0.5))  

qBinom100 <- data.frame(Q=q, Quantile=qbinom(q, size=100, prob=0.5))  

head(dBinom100)
head(qBinom100)

## plots
ggplot(data = dBinom100,
       aes(x= N, y = Density)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "N", breaks = seq(35,65, by = 1)) +
  scale_y_continuous(name = "Density") +
  ggtitle("Binomial Density (size = 100, p = 0.5)")


ggplot(data = dBinom100,
       aes(x= N, y = Distribution)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "N", breaks = seq(35,65, by = 1)) +
  scale_y_continuous(name = "Distribution") +
  ggtitle("Binomial Distribution (size = 100, p = 0.5)")


ggplot(data = qBinom100,
       aes(x= Q, y = Quantile)) +
  geom_path(colour = "red", lwd = 1.5) +
  scale_x_continuous(name = "Q", breaks = seq(0,1, by = 0.1)) +
  scale_y_continuous(name = "Quantile") +
  ggtitle("Binomial Quantile (size = 100, p = 0.5)")


#### TIDYVERSE ####
install.packages("tidyverse")
library(tidyverse)

## tidyr

u.rel <- "https://www.finley-lab.com/files/data/religion2.csv"

religion <- read.csv(u.rel, header=TRUE, stringsAsFactors = FALSE)
head(religion)
View(religion)

# conversion from wide format to the long format
religionLong <- pivot_longer(data = religion, cols = 2:11, 
                             names_to = 'IncomeLevel', values_to = 'Frequency')
head(religionLong)
View(religionLong)


# conversion from long to wide format
religionWide <- pivot_wider(data = religionLong, 
                            names_from = IncomeLevel, 
                            values_from = Frequency)
View(religionWide)

# separate a character column into two columns using a separate character 
View(starwars)

firstLast <- separate(data = starwars, col = name, 
                      into = c("firstName", "lastName"), sep="\\s")
View(firstLast)

# unite two columns into one
star <- unite(firstLast, col=name, firstName, lastName, sep="_")
View(star)

### dplyr ####
library(dplyr)

class(starwars) ## tibble
class(religion) ## data frame
religion
starwars

u.gm <- "https://www.finley-lab.com/files/data/gapminder.tsv"

gm <- read.delim(u.gm)
class(gm)
gm <- as_tibble(gm)
str(gm)
head(gm)

### filter()

filter(gm, country == "Brazil")
filter(gm, country == "India")
filter(gm, country %in% c("Brazil", "India") & year %in% c(2002,2007) )


### select ()

select(gm, country, year, lifeExp)

select(gm, country, year, lifeExp) %>%
  filter(country == "India")

g1 <- gm %>% 
  filter(continent %in% c("Asia", "Europe")) %>% 
  select(country, year, pop)

View(g1)

## arrange()

gm %>% 
  arrange(year, country)

gm %>% 
  filter(country == "India") %>% 
  arrange(lifeExp)


gm %>% 
  filter(country == "India") %>% 
  arrange(desc(lifeExp))

## summarise()

gm %>% 
  summarize(meanpop = mean(population),
            medpop = 	median(population))


gm %>%
  filter(country == "India") %>%
  summarise(meanpop = mean(pop),
            medpop = 	median(pop))


## group_by()

gm %>% 
  group_by(continent) %>% 
  summarize(medLifeExp = median(lifeExp)) 
