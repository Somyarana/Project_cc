
#### IF - ELSE ####

x <- 3

if(x %% 2 == 0){
  print("number is even")
} else {
  print("number is odd")
}

x <- -6

if(x > 0) {
  print("number is positive")
} else if(x == 0){
  print("number is equal to zero")
} else {
  print("number is negative")
}


# readline() : reads the data from the console
# it reads the data as a character
# one needs to convert the class of the variable according to the use
var <- readline()
class(var)
var <- as.numeric(var)
class(var)

x <- as.numeric(readline(prompt = "Enter the number: "))

if(x %% 2 == 0){
  print("number is even")
} else {
  print("number is odd")
}


#### FOR Loop ####

v <- LETTERS[1:5]

# length() : returns the length of the vector

# the iterator i will store the values at the index
for(i in v){
  print(i)
}

# printing the vector according to index number
# accessing the vector elements according to index number
for(i in 1:length(v)){
  print(v[i])
}

#### WHILE Loop ####

x <- 2

while(x < 10000){
  print(x)
  x = x^2
}

x

x <- 12

while(x < 20){
  print(x)
  x = x + 1
}


#### REPEAT Loop ####

x <- 2

repeat{
  x = x^2
  print(x)
  if (x > 10000){
    break
  }
}

#### SWITCH STATEMENT ####

v <- sample(1:100, 20)
v

option <- readline(prompt = "Enter the choice: ")

switch(option,
       "mean" = print(mean(v)),
       "median" = print(median(v)),
       "sd" = print(sd(v)))

a <- 10
b <- 34

option = readline(prompt = "Enter the choice: ")

switch(option,
       "add" = a+b,
       "subtract" = a-b,
       "multiply" = a*b,
       "divide" = a/b)






sum <- 0
for(i in v){
  sum = sum + i
}
m <- sum/length(v)
m

#### Statistical Functions ####

x <- sample(1:1000, 40)
x

# mean() : returns the mean of the vector
mean(x)

# median() : returns the median of the vector
median(x)

# sd() : returns the standard deviation of the vector
sd(x)

# var() : returns the variance of the vector
var(x)


# data frame example : iris

mean(iris$Sepal.Length)
median(iris$Sepal.Length)
sd(iris$Sepal.Length)
var(iris$Sepal.Length)


## geometric mean / harmonic mean

gm <- prod(x)^(1/length(x))
gm

hm <- (length(x)/(sum(1/x)))
hm

install.packages("psych")
library(psych)

geometric.mean(x)
harmonic.mean(x)


iris1 <- iris[,1:4]
View(iris1)

# cov() : returns the covariance of two vectors or a covariance matrix when whole data frame is passed

cov(iris1$Sepal.Length,iris1$Sepal.Width)

cov(iris1)

# cor() : returns the correlation between the two vectors or a correlation matrix when a whole data frame is passed

cor(iris1$Sepal.Length,iris1$Sepal.Width)

cor(iris1)

# min(): returns the minimum value from a vector

min(iris1$Sepal.Length)

# max() : returns the max value from a vector

max(iris1$Sepal.Length)

# dim() : returns the dimensionof the data frame / matrix / array
dim(iris1)

# colSums() : return the sum of the columns
colSums(iris1)

# rowSums() : returns the sum of the row
rowSums(iris1)

# colMeans() : returns the column means
colMeans(iris1)

# rowMeans() : returns the row means
rowMeans(iris1)

install.packages("outliers")
library(outliers)

outlier(iris1$Sepal.Length)
outlier(iris1$Sepal.Length, opposite = TRUE)


#### Regression ####
# lm() : to model the linear regression 

# y = bx + a

LModel <- lm(Petal.Width ~ Petal.Length,
             data = iris1)
LModel

summary(LModel)

# y  = 0.415755x - 0.363076

Mmodel <- lm(Sepal.Length ~ Petal.Length + Petal.Width,
             data = iris1)
Mmodel

summary(Mmodel)


# predict() : function to predict the values using the linear model
# object : linear model type object  >>> LModel
# newdata : data frame object which contains the same column name as used in the model
predict(LModel, newdata = data.frame(Petal.Length = c(2,5,7)))





