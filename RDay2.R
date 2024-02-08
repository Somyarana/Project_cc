
#### DATA FRAMES ####
# THE OBJECTS IN THE R WHICH THE DATA IN THE FORM OF TABLE
# one can have objects from different classes
# length of the vectors used to form the data frame should be same
# data frame is created using the keyword data.frame()


sid <- 1:5
sname <- c("kavita","anshul","neha","swapnil","vishnu")
score <- c(78,96,56,87,61)

student <- data.frame(sid, sname,score)
student

student[1,]
student[,1]
student[,2]

student$score
student$sname

# returns the structure of the data frame
str(student)

# returns the statistical summary of the numerical columns of the data frame
summary(student)

# attributes() returns the attribute data of the data frame or any object in R
attributes(student)

m3 <- matrix(1:9, nrow = 3, ncol = 3, dimnames = list(rnames,cnames))
m3

# attributes for the matrix
attributes(m3)

# names() : returns the column name of the data frame
names(student)

names(student) <- c("Student Id", "Student Name", "Score")
names(student)

names(student)[3] <- "Maths Score"
student

# head() : returns the 1st 6 rows of the data frame
# iris : example data data frame installed with the R

head(iris)
head(iris, n = 2)
head(iris, n = 10)

# tail() : returns the last 6 rows of the data frame
tail(iris)
tail(iris, n = 2)
tail(iris, n = 10)

# View() : returns the data frame in the tabular form in a new window
View(iris)
View(student)

# adding a new column in the data frame
student$"Physics Score" <- c(89,56,78,98,63)
View(student)

# delete a column in the data frame
student$`Physics Score` <- NULL
View(student)

# subset of data frame
View(iris)

iris1 <- iris[, 3:5]
View(iris1)

### rbind() : to bind the data row wise
student
student1 <- data.frame("Student Id" = 6:10,
                       "Studemt Name" = c("vishakha","ashu","lakshay","harsh","tanvi"),
                       "Maths Score" = c(87,56,78,98,45))
student1
names(student1) <- c("Student Id", "Student Name", "Maths Score")

student_df <- rbind(student, student1)
student_df


## cbind() : to add the data column wise
student2 <- data.frame(Physics = c(56,76,89,32,57),
                       chemistry = c(76,89,80,54,33))

student_df1 <- cbind(student, student2)
student_df1

#### JOIN OR MERGE TWO DATA FRAMES ####
# in R LETTERS is sample vector containing the English alphabets

A <- data.frame(letter = LETTERS[1:5], a = 1:5 )
B <- data.frame(letter = sample(LETTERS, 10), b = sample(1:100, 10))

A
B

# merge() : to merge the two data frames

# returns only the common data from the two data frames
C <- merge(A,B)
C

# return all the data from the first data frame
D <- merge(A,B, all.x = TRUE)
D

# return all the data from the second data frame
E <- merge(A,B, all.y = TRUE)
E

# all the data from both the data frames
F <- merge(A,B, all = TRUE)
F

A
G <- data.frame(l = sample(LETTERS[1:10],5), d = 8:12)
G

# when one have different column names in two data frames
I <- merge(A,G, by.x = "letter", by.y = "l")
I


### sorting

v1 <- sample(1:100, 20)
v1

v2 <- sort(v1)
v2

v3 <- sort(v1, decreasing = TRUE)
v3


### sorting the data frame using order() function
View(student_df)

st_df <- student_df[order(student_df$`Student Name`),]
st_df

student_df[order(student_df$`Student Name`, student_df$`Maths Score`),]

View(iris)
View(iris[order(iris$Sepal.Length,iris$Sepal.Width),])

# try sorting in the mtcars data set (in built data set)
View(mtcars)


#### STRING FUNCTIONS ####

s1 <- "CDAC"
s2 <- "noida"

# paste() : returns the concatenated strings
s3 <- paste(s1, s2)
s3

s4 <- paste(s1, s2, sep = ", ")
s4

# colors is a character vector which stores 3 different strings
colors <- c("red", "yellow", "blue")

paste("I like", colors, collapse = ", ")

c <- paste(colors, "flowers")
c

# using paste function for print
#print() : it only takes one argument

print(paste("the value of s3 =", s3))


# nchar(); returns the no of characters in a string
nchar(s3)

# toupper(); returns the string in uppercase
toupper(s3)

# tolower() : returns the string in lowercase
tolower(s3)

# substring(s3, start_index_no, end_index_no) : returns the substring
substring(s3, 2,8)

### match() : it compares two vectors, and returns the position of the element found in the second vector which is in the first vector
v1 <- sample(LETTERS, 8)
v1
LETTERS

match(v1,LETTERS)


### intersect() : returns the common elements from the two vectors
v2 <- sample(LETTERS, 6)
v2

intersect(v1, v2)

# union() : returns all the elements from both the vectors
union(v1,v2)

v3 <- c(v1, LETTERS)
v3

duplicated(v3)

# returning the position where the duplicate values existed
which(duplicated(v3))

# unique() : returns the unique values in the vector
unique(v3)


# arithmetical functions

# power ^ ; returns the n to the power m (n^m)

a = 2^5
a

# modulus %% : returns the remainder

b = 45%%4
b

## sqrt(): returns the square root
c = sqrt(100)
c

## log() : returns the logarithmic value (natural log)
d = log(23)
d

# log10() : returns the logarithmic value with base 10
e = log10(23)
e
