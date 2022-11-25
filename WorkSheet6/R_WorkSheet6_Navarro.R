#Neil Francis N. Navarro
#BSIT 2-A


#WorkSheet-6

#Use the dataset mpg

library(ggplot2)
data(mpg)
as.data.frame(data(mpg))
data(mpg)
mpg

str(mpg)
library(dplyr)
glimpse(mpg)
#Example. graph using ggplot()
ggplot(mpg, aes(cty, hwy)) +
  geom_point()

#1. How many columns are in mpg dataset? How about the number of rows? Show the codes and its result.
#There are 11 columns and 234 ows in the mpg data frame.

num1 <- glimpse(mpg)
nrow(mpg)
#> [1] 234
ncol(mpg)
#> [1] 11

#2. Which manufacturer has the most models in this data set? Which model has the most variations? Ans:
#Answer= dodge has 37 modelss
num2 <- mpg %>% 
  group_by(manufacturer) %>% 
  tally(sort = TRUE)

#a. Group the manufacturers and find the unique models. Copy the codes and result.
datampg <- mpg
num2a <- datampg %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
num2a

colnames(num2a) <- c("Manufacturer", "Model","Counts")
num2a

#b. Graph the result by using plot() and ggplot(). Write the codes and its result.

#plot
qplot(model, data = mpg,geom = "bar", fill=manufacturer)

#ggplot
ggplot(mpg, aes(model, manufacturer)) + geom_point()

#3. Same dataset will be used. You are going to show the relationship of the model and 
#the manufacturer.

datampg <- mpg
num3 <- datampg %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
num3

colnames(num3) <- c("Manufacturer", "Model")
num3

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?

ggplot(mpg, aes(model, manufacturer)) + geom_point()
#geometric point graph of mpg(model and manufacturer)

#b. For you, is it useful? If not, how could you modify the data to make it more informative?  
#Answer= Yes, It is useful because you could trackdown the data of each model of the manufacturer
#to modify the data:
ggplot(mpg, aes(model, manufacturer)) + 
  geom_point() +
  geom_jitter()

#4. Using the pipe (%>%), group the model and get the number of cars per model. 
#Show codes and its result.
datampg4 <- num2a %>% group_by(Model) %>% count()
datampg4

colnames(datampg4) <- c("Model","Counts")

#a. Plot using the geom_bar() + coord_flip() just like what is shown below. 
#Show codes and its result
qplot(model,
      data = mpg,main = "Number of Cars per Model", 
      xlab = "Model",
      ylab = "Number of Cars", 
      geom = "bar", fill = manufacturer) 
      + coord_flip()

#b. Use only the top 20 observations. Show code and results.

barplot(datampg4$Counts[1:20],
        names.arg=datampg4$Model[1:20])

#5. Plot the relationship between cyl - number of cylinders and displ - 
#engine displacement using geom_point with aesthetic colour = engine displacement.
#Title should be “Relationship  between No. of Cylinders and Engine Displacement”.
#a. Show the codes and its result.

ggplot(data = mpg , mapping = aes(x = displ, y = cyl, 
      main = "Relationship between No of Cylinders and Engine Displacement")) + 
  geom_point(mapping=aes(colour = "engine displacement")) + geom_jitter()
#b. How would you describe its relationship?
#Anwer= So according to the data by the making cyl into y, the graph is jittered. 
#And the pink color indicates the engine displacement as what can you see 
#it is in a dots on a straight horizontal position.

#6.Get the total number of observations for drv - type of drive train (f = front-wheel drive,
#r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.) 
#Plot using the geom_tile() where the number of observations for class be used as a 
#fill for aesthetics.
#a. Show the codes and its result for the narrative in #6.

ggplot(data = mpg, mapping = aes(x = drv, y = class)) + 
  geom_point(mapping=aes(color=class)) +
  geom_tile()
#b. Interpret the result: 
#Answer= Areas covered with black are "mapped" using the mapping geometric point graph. 
#y as class and x as drv.

#7. Discuss the difference between these codes. Its outputs for each are shown below.
#Code #1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

#+ Code #2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#8. Try to run the command ?mpg. What is the result of this command?
?mpg
#a. Which variables from mpg dataset are categorical? 
#Categorical variables in mpg which include: 
#the manufacturer, model, trans (type of transmission), 
#drv (front-wheel drive, rear-wheel, 4wd), fl (fuel type), and class (type of car).

#b. Which are continuous variables?
#Continuous varibles in R was also known as doubles or integers. 

#c. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon). 
#Mapped it with a continuous variable you have identified in #5-b.
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()

#What is its result? Why it produced such output? 
#data tracks the cty by placing cty(city miles per gallon) at color having a 
#variation or hues of blue.

#9.Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon) 
#using geom_point(). Add a trend line over the existing plot using geom_smooth() with se = FALSE. 
#Default method is “loess”.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE)

#10.Using the relationship of displ and hwy, add a trend line over existing plot. 
#Set the se = FALSE to remove the confidence interval and method = lm to check for linear modeling

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE)
