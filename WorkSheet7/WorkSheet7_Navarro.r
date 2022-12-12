#===============================================================================

#Neil Francis N> Navarro
#BSIT 2-A

#===============================================================================

#Worksheet#7

#===============================================================================
#-------------------------------------------------------------------------------
#1. Create a data frame for the table below 
#-------------------------------------------------------------------------------
#===============================================================================

Student <- seq(1:10)
PreTest <- c(55,54,47,57,51,61,57,54,63,58)
PostTest <- c(61,60,56,63,56,63,59,56,62,61)

num1 <- data.frame(Student,PreTest,PostTest)
num1

#===============================================================================

#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).
#Write the codes and its result.

library(Hmisc)
library(pastecs)

#Hmisc
describe(num1)

#Pastecs
stat.desc(num1)

#===============================================================================
#-------------------------------------------------------------------------------
#2. The Department of Agriculture was studying the effects of several levels of a
#fertilizer on the growth of a plant. For some analyses, it might be useful to convert
#the fertilizer levels to an ordered factor.
#-------------------------------------------------------------------------------
#===============================================================================

#• The data were 10,10,10, 20,20,50,10,20,10,50,20,50,20,10.

num2 <- c(10,10,10,20,20,50,10,
          20,10,50,20,50,20,10)

#===============================================================================

#a. Write the codes and describe the result.

num2factor <- factor(num2, ordered = TRUE)
num2factor

#===============================================================================
#-------------------------------------------------------------------------------
#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 num3 were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense
#-------------------------------------------------------------------------------
#===============================================================================

num3 <- c("l","n","n","i","l","l","n","n","i","l")

#===============================================================================

#a. What is the best way to represent this in R?

#Factor
factor(num3, levels = c("n","l","i"))

#===============================================================================
#-------------------------------------------------------------------------------
#4.Sample of 30 tax accountants from all the states and territories of Australia and
#their individual state of origin is specified by a character vector of state mnemonics
#as:
#-------------------------------------------------------------------------------
#===============================================================================

state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
           "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
           "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
           "vic", "vic", "act")

#===============================================================================

#a. Apply the factor function and factor level. Describe the results.

#factor function and factor level
num4a <- factor(state)
num4a

#Getting factor level of states
levels(num4a)

#===============================================================================
#-------------------------------------------------------------------------------
#5. From #4 - continuation:
#-------------------------------------------------------------------------------
#===============================================================================

#• Suppose we have the incomes of the same tax accountants in another vector (in
#suitably large units of money)

incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)

#===============================================================================

#a. Calculate the sample mean income for each state we can now use the special
#function tapply():

num5a <- tapply(incomes, state, mean)
num5a

#===============================================================================

#b. Copy the results and interpret.

num5a

#The result show the level and means of the income of each states.

#===============================================================================
#-------------------------------------------------------------------------------
#6.Calculate the standard errors of the state income means (refer again to number 3)
#-------------------------------------------------------------------------------
#===============================================================================

#a. What is the standard error? Write the codes.

num6.n <- length(num5a)
num6.sd <- sd(num5a)
num6.se <- num6.sd/sqrt(num6.n)
num6.se

#===============================================================================

#b. Interpret the result.

#This is how I get the state income means by dividing the sd() to sqrt() or length() 
#and that is how I get the standard errors of the state income means and this was 
#the result.

#===============================================================================
#-------------------------------------------------------------------------------
#7. Use the titanic dataset.
#-------------------------------------------------------------------------------
#===============================================================================

data(Titanic)
Titanic <- data.frame(Titanic)

#===============================================================================

#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.

#===============================================================================

survive <- subset(Titanic, Survived == "Yes")
survive

died <- subset(Titanic, Survived == "No")
died

#===============================================================================
#-------------------------------------------------------------------------------
#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this
#chronological grouping of the data. You can create this dataset in Microsoft Excel.
#-------------------------------------------------------------------------------
#===============================================================================

#a. describe what is the dataset all about.
#Answer =
#The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this 
#chronological grouping of the data

#===============================================================================

#b. Import the data from MS Excel. Copy the codes.
library("readxl")
num8b <- read_excel("C:\\Users\\neil navaroo\\Documents\\Breast_Cancer.xlsx")
num8b

View(num8b)

#===============================================================================

#c. Compute the descriptive statistics using different packages. Find the values of:
#c.1 Standard error of the mean for clump thickness.

num8c1.n <- length(num8b$`CL. thickness`)
num8c1.sd <- sd(num8b$`CL. thickness`)
num8c1.se <- num8c1.sd/sqrt(num8b$`CL. thickness`)
num8c1.se

#===============================================================================

#c.2 Coefficient of variability for Marginal Adhesion.

sd(num8b$`Marg. Adhesion`) / mean(num8b$`Marg. Adhesion`) * 100

#===============================================================================

#c.3 Number of null values of Bare Nuclei.

num8c3 <- subset(num8b,`Bare. Nuclei` == "NA")
num8c3

#===============================================================================

#c.4 Mean and standard deviation for Bland Chromatin

mean(num8b$`Bl. Cromatin`)
sd(num8b$`Bl. Cromatin`)

#===============================================================================

#c.5 Confidence interval of the mean for Uniformity of Cell Shape

#Calculate the mean
num8c5 <- mean(num8b$`Cell Shape`)
num8c5

#Calculate the standard error of the mean
numA <- length(num8b$`Cell Shape`)
numB <- sd(num8b$`Cell Shape`)
numC <- numB/sqrt(numA)
numC

#Find the t-score that corresponds to the confidence level
numD = 0.05
numE = numA - 1
numF = qt(p=numD/2, df=numE,lower.tail=F)
numF

#Constructing the confidence interval
numG <- numF * numC

#Lower
numH <- num8c5 - numG

#Upper
numI <- num8c5 + numG

c(numH,numI)

#===============================================================================

#d. How many attributes?

attributes(num8b)

#There are 3 and these are the class(3), row.name(49) and col.name/length(11).

#===============================================================================

#e. Find the percentage of respondents who are malignant. Interpret the results.
num8e <- subset(num8b, Class == "malignant")
num8e

#There 17 respondents who are malignant.
#And there are total of 49 respondent.

#Getting the percentage
18  / 49 * 100

#There are 36.73469 or 37% of respondents who are malignant.

#===============================================================================
#9. Export the data abalone to the Microsoft excel file. Copy the codes.
install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")

data(abalone)
View(abalone)
head(abalone)
summary

summary(num8b)

#Exporting the data abalone to the Microsoft excel file
library(xlsx)
write.xlsx("abalone","C:\\Users\\neil navaroo\\Documents\\abalone0.xlsx")

#===============================================================================