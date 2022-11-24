#Neil Francis N. Navarro
#BSIT 2-A


#WorkSheet-6

#Use the dataset mpg

library(ggplot2)
#to get the mpg dataset, load the ggplot package first
data(mpg)
as.data.frame(data(mpg)) #converting from list to data frame
data(mpg)
str(mpg)

library(dplyr) #glimpse() is a function under dplyr package

glimpse(mpg)

#• Example. graph using ggplot()
ggplot(mpg, aes(cty, hwy)) +
  geom_point()

#1. How many columns are in mpg dataset? How about the number of rows? Show the
#codes and its result.

ncol(mpg)
#Answer= 11
nrow(mpg)
#Answer= 234

#2. Which manufacturer has the most models in this data set? Which model has the most
#variations? 

#Answer= Toyota has the most numbers of models within the data set. And "caravan 2wd"
#has the most variation.

#a. Group the manufacturers and find the unique models. Copy the codes and result.
num2a1 <- table(mpg$manufacturer)
num2a2 <- table(mpg$model)

length(num2a1)
length(num2a2)


#b. Graph the result by using plot() and ggplot(). Write the codes and its result.

plot(num2a1)
plot(num2a2)

num2a <- barplot(num2a1, data=mpg, col="pink")
num2b <- barplot(num2a2, data=mpg, col="red")



#3. Same dataset will be used. You are going to show the relationship of the model and
#the manufacturer.

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?

plot(mpg, aes(model, manufacturer)) + geom_point()

#b. For you, is it useful? If not, how could you modify the data to make it more
#informative?
  
  
#4. Using the pipe (%>%), group the model and get the number of cars per model. Show
#codes and its result.


#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show
#codes and its result.


#b. Use only the top 20 observations. Show code and results.


#5. Plot the relationship between cyl - number of cylinders and displ - engine displacement using geom_point with aesthetic colour = engine displacement. Title should be
#“Relationship between No. of Cylinders and Engine Displacement”.


#a. Show the codes and its result.


#b. How would you describe its relationship?
  
  
#6. Get the total number of observations for drv - type of drive train (f = front-wheel drive,
#r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.).
#Plot using the geom_tile() where the number of observations for class be used as a
#fill for aesthetics.


#a. Show the codes and its result for the narrative in #6.


#b. Interpret the result.


#7. Discuss the difference between these codes. Its outputs for each are shown below.


#• Code #1
barplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#+ Code #2
barplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")



#8. Try to run the command ?mpg. What is the result of this command?


#a. Which variables from mpg dataset are categorical?
  
  
#b. Which are continuous variables?
  
  
#c. Plot the relationship between displ (engine displacement) and hwy(highway miles
#per gallon). Mapped it with a continuous variable you have identified in #5-b. What is its
#result? Why it produced such output?
  
  
#9. Plot the relationship between displ (engine displacement) and hwy(highway miles
#per gallon) using geom_point(). Add a trend line over the existing plot using
#geom_smooth() with se = FALSE. Default method is “loess”.


#10. Using the relationship of displ and hwy, add a trend line over existing plot. Set the
#se = FALSE to remove the confidence interval and method = lm to check for linear
#modeling.

