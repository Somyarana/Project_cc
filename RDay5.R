
#### Import or Export the data ####

### CSV file

setwd("C:\\Users\\Acer\\Desktop\\R\\Dataset")

# read a csv file
rainforest <- read.csv("rainforest.csv", 
                       header = TRUE,
                       sep = ",")
class(rainforest)
str(rainforest)
View(rainforest)

# write the csv file
class(iris)
write.csv(iris, file = "iris.csv")

# to write the file at particular location
write.csv(iris, file = "D:\\iris.csv")

### EXCEL file
# to read a excel file
# package >>> readxl

install.packages("readxl")
library(readxl)

# read excel
religion <- read_excel("religion.xlsx")
class(religion)
religion <- as.data.frame(religion)
class(religion)
View(religion)

# write excel
# package >>> openxlsx
install.packages("openxlsx")
library(openxlsx)

write.xlsx(mtcars,"mtcars.xlsx")

write.xlsx(mtcars, file = "mtcars.xlsx",
           borders = "all",
           overwrite = TRUE,
           sheetName = "Mtcars")

## read a text file

plasma <- read.delim("plasma.txt",
           header = TRUE,
           sep = "\t")
View(plasma)
class(plasma)


install.packages("readr")
library(readr)


write_delim(cars, file = "cars.txt",
            delim = "\t")


#### DATABASE Connectivity #####

install.packages("RMariaDB")
library(RMariaDB)

## connection is stored in a variable
storiesDb <- dbConnect(RMariaDB::MariaDB(),
                       user='root',
                       dbname='cdac',
                       host='localhost')

# call the list of the tables available in the database
dbListTables(storiesDb)

### INSERT QUERY ###

## storing the query in a variable
query <- "INSERT INTO course(COURSE_ID, COURSE_NAME) VALUES (1289, 'PGDVLSI')"
class(query)

print(query)

## storing the send query to the database in a variable
rsInsert <- dbSendQuery(storiesDb, query)

# to clear the send query variable so it will reflect the result in the database
dbClearResult(rsInsert)

### SELECT Query ###

query1 <- "SELECT * FROM nobel_win"

rsSelect <- dbSendQuery(storiesDb, query1)

# fetching the query from the send query variable
rsStore <- dbFetch(rsSelect)

class(rsStore)
View(rsStore)

dbClearResult(rsSelect)

# close the connection 
dbDisconnect(storiesDb)



query1 <- "SELECT * FROM nobel_win WHERE year = 1970"

rsSelect <- dbSendQuery(storiesDb, query1)

# fetching the query from the send query variable
rsStore <- dbFetch(rsSelect)

class(rsStore)
View(rsStore)

dbClearResult(rsSelect)

# close the connection 
dbDisconnect(storiesDb)

#### DATA Visualization ####

### amount of rainfall in mm
v <- c(7,12,38,23,40) # 2020
t <- c(4,6,15,30,39)  # 2021

#### Line chart

# plot() : function draws the plot using the varibles 
# v : variable to be plot
# type : type of the plot
# "o" : both line and point will be plotted
# "l" : only lines are plotted
# "p" : only points are plotted
# xlab : x axis label
# ylab : y axis label
# main : title of the plot
# pch : type of point plotted
# lwd : line width
# lty : type of line

plot(v,
     type = "p",
     col = "red",
     xlab = "Months",
     ylab = "Rainfall in mm",
     main = "Rainfall Chart",
     pch = 17)


plot(v,
     type = "l",
     col = "red",
     xlab = "Months",
     ylab = "Rainfall in mm",
     main = "Rainfall Chart",
     lwd = 2)

plot(v,
     type = "o",
     col = "red",
     xlab = "Months",
     ylab = "Rainfall in mm",
     main = "Rainfall Chart",
     pch = 16,
     lwd = 2,
     lty = 2)

# adding the another variable in the same plot
lines(t,
      type = "o",
      col = "blue",
      pch = 16,
      lwd = 2)
# to add the grid
grid()


## histogram
# hist() : returns the histogram

hist(iris$Petal.Length)
hist(iris$Petal.Length, breaks = 2)
hist(iris$Petal.Length, breaks = 10)
hist(iris$Petal.Length, breaks = 10, xlim = c(1,8))
hist(iris$Petal.Length, breaks = 10,
     xlab = "Petal Length",
     ylab = "Frequency",
     main = "Histogram of Petal Length",
     col = "blue")

# boxplot
# boxplot() returns the boxplot

boxplot(iris$Petal.Length)
boxplot(iris$Petal.Length, horizontal = TRUE, col = "blue")

boxplot(iris)


## pie chart
# pie() function used to draw a pie chart
x <- c(200,100,300,400)
l <- c("Sri Lanka", "Nepal","China","India")

pie(x, l,
    radius = 1,
    main = "Pie Chart")

ColVector <- c("purple","violetred","green3","cornsilk")

pie(x, l,
    radius = 1,
    col = ColVector,
    main = "Pie Chart")

## scatter plots
iris

plot(iris$Petal.Length, iris$Petal.Width,
     col = "red",
     pch = 16,
     xlab = "Petal Length",
     ylab = "Petal Width",
     main = "Scatter Plot")

## regression line
Lmodel <- lm(Petal.Width ~ Petal.Length,
             data = iris)
# abline() adds the regression line in the scatter plot
abline(Lmodel,
       col = "blue",
       lwd = 2)

library(ggplot2)

# data is added from a data frame
# the graphs or elements of the graphs are added as layer
# the last graph or element added is at the top
# the graph elements are added in the layer form


# ggplot() : to add the data
# geom_point() : to plot the points
# geom_line() : to plot the lines


rainfall <- data.frame(month = 1:5,
                      year2020 = v,
                      year2021 = t)


ggplot(data = rainfall,
       aes(x = month, y = year2020)) +
  geom_point(colour = "blue", size = 2)



ggplot(data = rainfall,
       aes(x = month, y = year2020)) +
  geom_point(colour = "blue", size = 2) +
  geom_line(colour = "blue", linewidth = 1) +
  geom_point(data = rainfall,
             aes(y = year2021),
             col = "red",
             size = 2) +
  geom_line(data = rainfall,
            aes(y = year2021),
            colour = "red",
            linewidth = 1) +
  xlab("Months") +
  ylab("Rainfall in mm") +
  ggtitle("Rainfall Chart") +
  theme_dark()


ggplot(data = iris,
       aes(x = Petal.Length,  y = Petal.Width)) +
  geom_point(colour = "red", size = 1.5)

ggplot(data = iris,
       aes(Petal.Length)) +
  geom_histogram(binwidth = 0.3, bins = 20)


ggplot(data = iris,
       aes(y = Petal.Length)) +
  geom_boxplot()

iris1 <- iris[,1:4]

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

# chart.Correlation() : returns the correlation chart with the scatter plots between the numerical columns in the data frame

chart.Correlation(iris1,
                  method = "pearson",
                  histogram = TRUE,
                  pch = 16)
library(psych)
# pairs() returns the scatter plot between the data frames
pairs(data = iris1,
      ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width)










