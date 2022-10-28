#1. use data(iris)
data("iris")
iris

#Subset Iris into 3 files per Species 
#2nd File subset of Versicolor

subset(iris, Species == "versicolor")

#Get the total mean of each Species (3rd File: versicolor)

#Declare each column of iris to calculate the total mean of the versicolor
mean1 <- iris$Sepal.Length[51:100]
mean2 <- iris$Sepal.Width[51:100]
mean3 <- iris$Petal.Length[51:100]
mean4 <- iris$Petal.Width[51:100]
 
mean1
mean2
mean3
mean4
 
#Get the total mean
totalmean1 <- c(mean1,mean2,mean3,mean4)
totalmean1
 
mean(totalmean1) #Total mean is 3.573 in versicolor Species


#Get the mean of each characteristics:
mean(mean1)#Output is 5.936
mean(mean2)#Output is 2.77
mean(mean3)#Output is 4.26
mean(mean4)#Output is 1.326