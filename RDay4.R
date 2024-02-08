
#### Simple Linear Regression ####

# what is regression?
# estimating the unknown values using the known ones
# y = bx + a
# y >> dependent variable or estimating variable
# x >>> independent variable or predictor variable
# b >> slope
# a >> intercept, where the regression line is crossing the y axis

# lm() : linear regression function to create a model

iris1 <- iris[,c(1:4)] 
View(iris1)

# correlation >> tells the relationship between the two variables
# value -1 to 1
# -ve corr >> when x value increases the y value decreases and visa versa
# +ve corr >>> when the x values increases the y value also increases and visa versa
# value is close to 1 means that they are highly correlated

cor(iris1)

Lmodel <- lm(Petal.Width ~ Petal.Length,
             data = iris1)

summary(Lmodel)
# y = 0.415755x - 0.363076

# b = cor(x,y)* (sd(y)/sd(x))
# a = mean(y) - b*mean(x)
# corr(x,y) = cov(x,y)/(sd(x)*sd(y))
# cov(x,y) = sum(xi-mean(x)*(yi-mean(y)))/n

# predict() : used to predict the values

df <- data.frame(Petal.Length = c(1,4,6,3))
predict(Lmodel,
        newdata = df)

# seq(min,max, by) : function in r to create a sequence by using the min, max values and the increment value
length1 <- seq(min(iris1$Petal.Length),
               max(iris1$Petal.Length),
                   by = 0.1)
length(length1)

predict.data <- predict(Lmodel,
                        newdata = data.frame(Petal.Length = length1))
predict.data

petal <- data.frame(Petal.Length = length1,
                    Petal.Width = predict.data)
View(petal)

## Creating a user defined function in R ####

# create a function to check the number is even or odd

EvenOdd <- function(x){
  if(x%%2 == 0){
    print("Number is even")
  } else {
    print("Number is odd")
  }
  
}

EvenOdd(5)
EvenOdd(8)


v <- 1:20

VectSum <- function(x){
  sum <- 0
  for(i in x){
    sum <- sum + i
  }
  return(sum)
}

VectSum(v)
a <- VectSum(v)
a


#### Packages in R ####

# packages in R are the collection of R functions, compile codes or sample data sets
# these are stores in local machine under the directory library
# by default R has certain packages installed

# if one want to install a package
# install.packages("package_name")

# to a package in your current working directory
# library(package_name)

# check the path of the installed packages
.libPaths()

# search() : returns the packages which are loaded in your curren working directory
search()

# installing a package
install.packages("ggplot2")

# load the package
## ggplot2 >> for plotting the graphics or beautiful plots
library(ggplot2)

# datarium >> contains sample data sets
install.packages("datarium")

library(datarium)

# checking the sample data sets available
data()

d <- diamonds

# get your current working directory
getwd()

# set the current working directly
# 
setwd("C:\\Users\\Acer\\Desktop\\R\\Dataset")
# OR
setwd("C:/Users/Acer/Desktop/R/Dataset")

getwd()









