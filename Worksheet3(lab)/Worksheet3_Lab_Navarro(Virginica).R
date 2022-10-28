#1. use data(iris)
data("iris")
iris

#Subset Iris into 3 files per Species 
#3rd File Subset of Virginica 

subset(iris, Species == "virginica")

#Get the total mean of each Species (3rd Filenamed: Virginica)

#Declare each column of iris to calculate the total mean of the virginica
mean1 <- iris$Sepal.Length[101:150]
mean2 <- iris$Sepal.Width[101:150]
mean3 <- iris$Petal.Length[101:150]
mean4 <- iris$Petal.Width[101:150]
 
mean1
mean2
mean3
mean4
 
#Get the total mean
totalmean1 <- c(mean1,mean2,mean3,mean4)
totalmean1
 
mean(totalmean1) #Total mean is 4.285 in virginica Species


#Get the mean of each characteristics:
mean(mean1)#Output is 6.588
mean(mean2)#Output is 2.974
mean(mean3)#Output is 5.552
mean(mean4)#Output is 2.026
