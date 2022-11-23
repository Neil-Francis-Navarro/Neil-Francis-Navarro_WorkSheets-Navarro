#Neil Francis N. Navarro
#BSIT 2-A

#Worksheet4
library(dplyr)
library(readr)
library(data.table)

#a. Describe the data.

Shoesize <- c(6.5,9.0,8.5,8.5,10.5,7.0,9.5,9.0,13.0,
              7.5,10.5,8.5,12.0,10.5,
              13.0,11.5,8.5,5.0,10.0,
              6.5,7.5,8.5,10.5,8.5,10.5,11.0,9.0,13.0)

Height <- c(66.0,68.0,64.5,65.0,70.0,
            64.0,70.0,71.0,72.0,64.0,
            74.5,67.0,71.0,71.0,77.0,72.0,
            59.0,62.0,72.0,66.0,64.0,67.0,73.0,
            69.0,72.0,70.0,69.0,70)

Gender <- c("F","F","F","F","M","F","M","F","M",
             "M","M","F","M","M","M","M","F","F",
            "M","F","M","M","M","F","M","M","M","M")

 data_frame <- data.frame(Shoesize,Height,Gender)
 data_frame
 
#b. Find the mean of shoe size and height of the respondents.
#Copy the codes and results.
 
#Male
Boy <- subset(data_frame, Gender == "M")
mean(Boy$Shoesize)
#[1] 10.47059
mean(Boy$Height)
#[1] 70.5

#Female
Girl <- subset(data_frame, Gender == "F")
mean(Girl$Shoesize)
#[1] 7.772727
mean(Girl$Height)
#[1] 65.59091

#Overall Mean
mean(Shoesize)
#[1] 9.410714
mean(Height)
#[1] 68.57143

#c. Is there a relationship between shoe size and height? Why?

# Yes, The Higher the value of height, the greater value of the Shoesize.
#and the factor levels below are the actual values.

#2. Construct character vector months to a factor with factor() and assign the result to
#factor_months_vector. Print out factor_months_vector and assert that R prints out
#the factor levels below the actual values.

Months_Vector <- c("March","April","January","November","January",
                   "September","October","September","November","August",
                   "January","November","November","February","May","August",
                   "July","December","August","August","September","November","February","April")
Factor_Month_Vector <- factor(Months_Vector)
Factor_Month_Vector


#3. Then check the summary() of the Months_Vector_vector and Factor_Month_Vector_vector. |
#Interpret the results of both vectors. Are they both equally useful in this case?
summary(Months_Vector)
summary(Factor_Month_Vector)

#Answer: For me Yes, as for the months_vector it shows the number of months and its class and mode, while
#the factor_Month_Vector the month has been factor by level and alphabetical and it show the number of
#each months.


#4. Create a vector and factor for the table below.
factorData <- data.frame(
 Direction = c("East","West","North"),
 Frequency = c(1,4,3)
)
factorData

newOrderData <- factor(factorData,levels = c("East","West","North"))
print(newOrderData)

#5. Enter the data below in Excel with file name = import_march.csv

#a. Import the excel file into the Environment Pane using read.table() function.
library(readr)
import_march <- read.table("import.march.csv")
View(import_march)

#b. View the dataset. Write the code and its result.
import_march




