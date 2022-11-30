#Neil Francis N. Navarro
#BSIT 2-A

#Individual Project 2

#===============================================================================

#Packages that will be needed 
library("twitteR") 
library(dplyr)
library(tidyr)
library("plotly")
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(rtweet)
library(tm)
library(slam)
library(wordcloud)
library(wordcloud2)
library(corpus)

#===============================================================================
#-------------------------------------------------------------------------------
##1. Extract from twitter using your developer's credentials. Choose any keyword you want. 
#-------------------------------------------------------------------------------
#===============================================================================

#Set-up credentials
CONSUMER_SECRET <- "vszUMNiOPeq1GRJmY1nuBHjFtZ6LsN0aO6CxYcnc2py27dNitF"
CONSUMER_KEY <- "aOMew0VvV9MbbQ5vEGCD1DQdg"
ACCESS_SECRET <- "1WlX6wXKyVV5My2GtoRltT9OtZzAyods5tSUIXWbUsZLp"
ACCESS_TOKEN <- "1595950464826507264-doMSI0oqDJdqmxTX4aO7ohaTSCAKuM"

#===============================================================================

#connect to twitter app
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#===============================================================================
#-------------------------------------------------------------------------------
##2. Get 10000 observations "excluding retweets.
#-------------------------------------------------------------------------------
#===============================================================================

#Getting a data
#it would take few minutes to load which depend the number of data you need
#but when you already save this data as a file you can skip this part.
trendTweets2 <- searchTwitter("#tiktok",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-20",
                             until = "2022-11-24",
                             retryOnRateLimit=120)

trendTweets2

#===============================================================================

#Or load the save files
load(file = "trendingTweetsDF2.Rdata")
load(file = "tweetsDf2.Rdata")

#===============================================================================

#Converting data into dataframe
trendTweetsDF2 <- twListToDF(trendTweets2)
class(trendTweetsDF2)
names(trendTweetsDF2)
View(trendTweetsDF2)
head(trendTweetsDF2)[1:5]
head(trendTweetsDF2$text)[1:5]

#Saving the data into a file
save(trendTweetsDF2,file = "trendingTweetsDF2.Rdata")
load(file = "trendingTweetsDF2.Rdata")

#===============================================================================

#Checking for missing values in a data frame
sapply(trendTweetsDF2, function(x) sum(is.na(x)))

#Subsetting using the dplyr()package
tweetsDF2 <- trendTweetsDF2 %>%
  select(screenName,text,created,statusSource,retweetCount)

#saving file as Rdata
save(tweetsDF2, file = "tweetsDF2.Rdata")
load(file = "tweetsDF2.Rdata")

#===============================================================================
#-------------------------------------------------------------------------------
##3. Plot the time series from the date created. with legends.
#-------------------------------------------------------------------------------
#===============================================================================

#plotting time series graph using plot() by rtweet package base on the date created.

ggplot(data = tweetsDF2, aes(x = created), fill = tweetsDF2) +
  geom_histogram(aes(fill = ..count..)) + 
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")
  
  
  
  
  #===============================================================================
#-------------------------------------------------------------------------------
##4. Plot a graph (any graph you want)  based on the type of device - found in Source
#- that the user use. Include the legends.
#-------------------------------------------------------------------------------
#===============================================================================

encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  #This looks unreliable...
    "facebook"
  }else {
    "others"
  }
}


tweetsDF2$tweetSource = sapply(tweetsDF2$statusSource, 
                              encodeSource)

tweet_appSource2 <- tweetsDF2 %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

Source_subset2 <- subset(tweet_appSource2,count >10)

#===============================================================================

dataDF2 <- data.frame(
  category = tweet_appSource2$tweetSource,
  count = tweet_appSource2$count
)

dataDF2$fraction = dataDF2$count / sum(dataDF2$count)
dataDF2$percentage = dataDF2$count / sum(dataDF2$count) * 100
dataDF2$ymax = cumsum(dataDF2$fraction)
dataDF2$ymin = c(0, head(dataDF2$ymax, n=-1))
dataDF2$roundP = round(dataDF2$percentage, digits = 2)

#===============================================================================

#plotting using geom_bar() - bar graph
ggplot(tweetsDF2[tweetsDF2$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

#===============================================================================
#-------------------------------------------------------------------------------
##5. Create a wordcloud from the screenName
#-------------------------------------------------------------------------------
#===============================================================================

#Using wordcloud() package but using a shape pentagon 
tweet_appScreen2 <- tweetsDF2 %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#convert to Corpus
namesCorpus2 <- Corpus(VectorSource(tweetsDF2$screenName))

#Running the code using the wordcloud()
wordcloud2(data=tweet_appScreen2, 
           size=0.8, 
           color='random-dark',
           shape = 'pentagon')

#===============================================================================