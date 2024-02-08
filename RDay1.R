
# to comment a line
# indexing in R starts from 1

#### Basic R ####

a = 1
b = "CDAC"
c = TRUE
d = 10+2i

class(a)
class(b)
class(c)
class(d)

# print a value of any variable using two methods
# 1. with variable name
a
b
c
d

# 2. using the print() function
print(a)
print(b)
print(c)
print(d)


#### Arithmetic Operators ####
x = 10
y = 20

# Addition [+]
z = x + y
z

# subtraction [-]
z = x - y
z

# multiplication [*]
z = x * y
z

# division [/]
z = x / y
z

#### Assignment Operators ####
a = 1
a <- 1
1 -> a

#### Relational Operators ####
x = 20
y = 30

z  = x > y
z
z = y > x
z
z = x <= y
z
z = x!=y
z

### Logical Operators ####
x <- 1
y <- 0

# & [AND]
z = x & y
z

# | [OR]
z = x|y
z

# ! [NOT]
z <- !x
z

#### Special operators ####

# : operator
v <- 1:5

# %in% : identify an element is inside a vector or not

v

1 %in% v
6 %in% v

### VECTORS ####

v1 <- c(1,3,45,7,8)
v1
class(v1)

v2 <- 1:6
v2

v3 <- sample(1:100, 6)
v3

v4 <- c("CDAC","NOIDA","PGDBDA")
v4
class(v4)

v5 <- c(TRUE,TRUE,FALSE)
v5
class(v5)

v6 <- c(1+1i,2+4i,5+6i)
v6
class(v6)


v7 <- c(v1,v3)
v7
class(v7)

v8 <- c(v1,v4)
v8
class(v8)

v9 <- c(v1,v5)
v9
class(v9)

#### LIST ####

# list is created using the list() keyword

l1 <- list(v1,v4,v5,v6)

l1
# print the 1st list inside the list object
## pass the list number inside the double square brackets
l1[[1]]

#### MATRIX ####
## matrix is created using the keyword matrix

##matrix(data,nrow,ncol,byrow, dimnames)

# byrow argument is false by default
# this means the data added in the matrix is by column wise
m1 <- matrix(data = 1:9, nrow = 3, ncol = 3)
m1

# data is added row wise
m2 <- matrix(data = 1:9, nrow = 3, ncol = 3, byrow = TRUE)
m2

# adding the dimension names
rnames <- c("r1","r2","r3")
cnames <- c("c1","c2","c3")

m3 <- matrix(1:9, nrow = 3, ncol = 3, dimnames = list(rnames,cnames))
m3

# access the particular element in a matrix
m3[2,3]

# entire particular row
m3[1,]

# entire particular column
m3[,2]

#### ARRAY ####
# create an array using the keyword array()

arr <- array(c(m1,m2,m3), dim = c(3,3,3))
arr

arr[2,3,1]
arr[2,3,2]
arr[1,,1]
arr[,1,1]

arr[1,1,]
arr[2,3,]



