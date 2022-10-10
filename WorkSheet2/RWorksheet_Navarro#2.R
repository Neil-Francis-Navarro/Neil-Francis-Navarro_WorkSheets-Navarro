#Neil Francis N. Navarro
#BSIT 2-A

#WORKSHEET2

#1
seq(-5,5)

x <- 1:7
x

#2
seq(1, 3, by=0.2)

#3
ages <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37,
            34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 
            35, 24, 33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 
            61, 54, 58, 26,18)
ages[3]

ages[2]
ages[4]

#4
names <- c("first"=3, "second"=0, "third"=9)
names

names[c("first", "third")]

#5
num5 <- c(-3:2)
num5

num5A <- 0
num5A

#6
deisel <- data.frame(
  
  Months = c("Jan", "Feb", "March", "Apr", "May", "June"),
  Php = c(52.50, 57.25, 60.00, 65.00,74.25, 54.00),
  Liter = c(25, 30, 40, 50, 10, 45),
  stringsAsFactors = FALSE
                    )
deisel

deisel$Php
deisel$Liter

weighted.mean(Liter,Php)

#7
data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), 
          var(rivers),sd(rivers), min(rivers), max(rivers))
data

#8
  PowerRanking <- 1:25
  Celebrities <- c("Tom Cruise", "Rolling Stones", "Oprah Winfrey", "U2", "Tiger Woods",
          "Steven Spielherg", "Howard Stern", "50 Cent", "Cast of the Sopranos",
          "Dan Brown", "Bruce Springsteen", "Donald Trump", "Muhammad Ali",
          "Paul McCartney","George Lucas","Elton John","David Letterman","Phil Mickelson",
          "J.K Rowling","Bradd Pitt","Peter Jackson","Dr. Phil McGraw",
          "Jay Lenon","Celine Dion","Kobe Bryant")
  Pay <- c(67,90,225,110,90,332,302,41,52,88,55,44,55,40,233,34,40,47,75,25,39,45,32,40,31)
  
  Ranking <- data.frame(PowerRanking, Celebrities, Pay)
  Ranking



  PowerRanking[19] <- 15;
  PowerRanking  
  
  Pay[15] <- 90;
  Pay

  ArtistRanking <- data.frame(PowerRanking, Celebrities, Pay)
  ArtistRanking  

  
  