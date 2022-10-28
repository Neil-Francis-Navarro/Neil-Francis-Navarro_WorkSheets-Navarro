#Neil Francis Navarro
#BSIT 2-A

#WorkSheet3

#1. There is a built-in vector LETTERS contains the uppercase letters of the alphabet
#and letters which contains the lowercase letters of the alphabet.

#LETTERS
## [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
## [20] "T" "U" "V" "W" "X" "Y" "Z"
#letters
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"
## [20] "t" "u" "v" "w" "x" "y" "z"

LETTERS <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", 
               "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
LETTERS


letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", 
             "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
letters

#Based on the above vector LETTERS:
#a. You need to produce a vector that contains the first 11 letters.
LETTERS[1:11]

#b. Produce a vector that contains the odd numbered letters.
odd <- LETTERS[1:26 %% 2 != 0]
odd

#c. Produce a vector that contains the vowels
vowel <- LETTERS[]

#Based on the above vector letters:
#d. Produce a vector that contains the last 5 lowercase letters.

  
#e. Produce a vector that contains letters between 15 to 24 letters in lowercase.

#2. Create a vector with the average temperatures in April for Tuguegarao City, Manila,
#Iloilo City, Tacloban, Samal Island, and Davao City. The average temperatures in
#Celcius are 42, 39, 34, 34, 30, and 27 degrees.

Average_Tempereature <- (
  April_Temperature <- c("Tuguegarao City", "Manila", "Iloilo City", "Tacloban" , "Samal Island",
                         "Davao City"),
  Celcius <- c( 42, 39, 34, 34, 30, 27)
)
Average_Tempereature

#a. What is the R code and its result for creating a character vector for the city/town of
#Tuguegarao City, Manila, Iloilo City, Tacloban, Samal Island, and Davao City? Name the
#object as city. The names should follow the same order as in the instruction.


#b. The average temperatures in Celcius are 42, 39, 34, 34, 30, and 27 degrees.
#Name the object as temp. Write the R code and its output. Numbers should also follow what
#is in the instruction.

#c. Associate the temperature temp with the city by using names() function. What is
#the R code and its result?
  
#e. From the answer in d, what is the content of index 5 and index 6? What is its R code?





