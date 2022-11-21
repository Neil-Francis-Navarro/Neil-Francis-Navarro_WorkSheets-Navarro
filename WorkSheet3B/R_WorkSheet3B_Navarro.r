#Neil Francis N. Navarro
#BSIT 2-A

#Worksheet#3b
install.packages("dplyr")
library(dplyr)
library(tidyverse)

#Gabby

#1. Create a data frame using the table below.
# a.Write the codes.
data_frame <- data.frame(
Respondents = c(seq(1,20)),
Sex = c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2),
FathersOccupation = c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1),
Personsathome = c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6), 
Siblingsatschool = c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2),
Typesofhouses = c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2))

data_frame

#b.Describe the data. Get the structure or the summary of the data

summary(data_frame)


#c. Is the mean number of siblings attending is 5?
#Answer: No 

#d. Extract the 1st two rows and then all the columns using the subsetting functions.
#Write the codes and its output.

num1d <- subset(data_frame[1:2, 1:6, drop = FALSE])
num1d

#e. Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its
#result.
num1e <- subset(data_frame[c(3,5),c(2,4)])
num1e
#f. Select the variable types of houses then store the vector that results as types_houses.
#Write the codes.
num1f <- data_frame[c(6)]

type_houses <- num1f


 #g. Select only all Males respondent that their father occupation was farmer. Write
#the codes and its output.
num1g <- subset(data_frame[c(3,11),c(2,3)])
num1g

#h. Select only all females respondent that have greater than or equal to 5 number
#of siblings attending school. Write the codes and its outputs

num1h <- subset(data_frame[c(1:20), c(2,5)])
girl <- num1h[data_frame$Siblingsatschool >= 5,]
girl
#2. Write a R program to create an empty data frame. Using the following codes:
  dtframe = data.frame(Ints=integer(),
                  Doubles=double(), Characters=character(),
                  Logicals=logical(),
                  Factors=factor(),
                  stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(dtframe))


