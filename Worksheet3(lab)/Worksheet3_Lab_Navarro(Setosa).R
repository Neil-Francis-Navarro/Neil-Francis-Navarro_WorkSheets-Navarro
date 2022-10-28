#1. use data(iris)
data("iris")
iris

#Subset Iris into 3 files per Species 
#1st File subset of setosa

subset(iris, Species == "setosa")

#Get the total mean of each Species.

#Declare each column of iris to calculate the total mean of the setosa
mean1 <- iris$Sepal.Length[1:50]
mean2 <- iris$Sepal.Width[1:50]
mean3 <- iris$Petal.Length[1:50]
mean4 <- iris$Petal.Width[1:50]

mean1
mean2
mean3
mean4

#Get the total mean
totalmean1 <- c(mean1,mean2,mean3,mean4)
totalmean1

mean(totalmean1) #Total mean is 2.5355 in setosa Species


#Get the mean of each characteristics:
mean(mean1)#Output is 5.006
mean(mean2)#Output is 3.428
mean(mean3)#Output is 1.462
mean(mean4)#Output is 0.246