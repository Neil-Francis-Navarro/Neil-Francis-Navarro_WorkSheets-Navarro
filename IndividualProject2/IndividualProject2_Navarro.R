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
##Extract from twitter using your developer's credentials. Choose any keyword you want. 
#-------------------------------------------------------------------------------
#===============================================================================

#Set-up credentials
CONSUMER_SECRET <- "41PDexRe92yfNTbt8a2fvJun8f90q9Zwz29uOGY7ZGhhag9CjK"
CONSUMER_KEY <- "UPrRGJE4UWIUnTxkEjTKHppF0"
ACCESS_SECRET <- "fcaPBNu4qYlU4q1UKXQQL3s8DKBEFnewwr38PGBJ2hlQp"
ACCESS_TOKEN <- "1595950464826507264-3WI3S7lwlHPgsMVpNzaGRVpjdWsUrn"

#===============================================================================

#connect to twitter app
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#===============================================================================
#-------------------------------------------------------------------------------
##Extract 10000 tweets from Twitter using twitteR package including retweets.
#-------------------------------------------------------------------------------
#===============================================================================

#Getting a data
#it would take few minutes to load which depend the number of data you need
#but when you already save this data as a file you can skip this part.

trendTweets <- searchTwitter("#tiktok -filter:retweets",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-29",
                             until = "2022-12-03",
                             retryOnRateLimit=120)

trendTweets

trendTweets2 <- searchTwitter("#tiktok",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-29",
                             until = "2022-12-03",
                             retryOnRateLimit=120)

trendTweets2

#===============================================================================
#-------------------------------------------------------------------------------
##Subset the retweets and the original tweets into a separate file
#-------------------------------------------------------------------------------
#===============================================================================

#Saving and loading original tweets and retweets data 
load(file = "trendingTweetsDF.Rdata")
load(file = "tweetsDF.Rdata")
load(file = "trendingTweetsDF2.Rdata")
load(file = "tweetsDF2.Rdata")

#===============================================================================

#Converting data into dataframe
trendTweetsDF <- twListToDF(trendTweets)

trendTweetsDF2 <- twListToDF(trendTweets2)

#Saving the data into a file
save(trendTweetsDF,file = "trendingTweetsDF.Rdata")

save(trendTweetsDF2,file = "trendingTweetsDF2.Rdata")

##Original Tweets
#Subsetting using the dplyr()package
tweetsDF <- trendTweetsDF %>%
  select(screenName,text,created,statusSource,retweetCount)

save(tweetsDF, file = "tweetsDF.Rdata")

##Retweets
#Subsetting using the dplyr()package
tweetsDF2 <- trendTweetsDF2 %>%
  select(screenName,text,created,statusSource,retweetCount)

save(tweetsDF2, file = "tweetsDF2.Rdata")

#===============================================================================
#-------------------------------------------------------------------------------
##Plot the retweets and the original tweets using bar graph in vertical manner.
#-------------------------------------------------------------------------------
#===============================================================================

#Saving and loading original tweets based on the project 1 data

encodeSource <- function(tweetsDF) {
  if(grepl(">Twitter for iPhone</a>", tweetsDF)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", tweetsDF)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", tweetsDF)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", tweetsDF)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", tweetsDF)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", tweetsDF)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", tweetsDF)){
    "ifttt"
  }else if(grepl(">Facebook</a>", tweetsDF)){  #This looks unreliable...
    "facebook"
  }else {
    "others"
  }
}


tweetsDF$tweetSource = sapply(tweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

Source_subset <- subset(tweet_appSource,count >10)
save("Source_subset", file = "Source_subset.Rdata")

#===============================================================================
#Loading and saving retweets

encodeSource2 <- function(tweetsDF2) {
  if(grepl(">Twitter for iPhone</a>", tweetsDF2)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", tweetsDF2)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", tweetsDF2)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", tweetsDF2)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", tweetsDF2)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", tweetsDF2)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", tweetsDF2)){
    "ifttt"
  }else if(grepl(">Facebook</a>", tweetsDF2)){  
    "facebook"
  }else {
    "others"
  }
}


tweetsDF2$tweetSource = sapply(tweetsDF2$statusSource, 
                              encodeSource2)

tweet_appSource2 <- tweetsDF2 %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

Source_subset2 <- subset(tweet_appSource2)
save("Source_subset2", file = "Source_subset2.Rdata")

#===============================================================================
#Plotting original and retweets using bargraph() in a vertical matter.

original <- data.frame(Source_subset$count)
retweets <- data.frame(Source_subset2$count)

Number_of_Tweets <- data.frame(original,retweets)

barplot(as.matrix(Number_of_Tweets),
        col = c("lightblue", "mistyrose", "lightcyan",
                "lavender", "cornsilk"),
        main = "Number of Original Tweets and Retweets of #tiktok",
        ylab = "Number of users", 
        xlab = NULL,
        beside = T) 

legend("topright", c("iphone","android","ipad","ifttt","others"),
       cex = 0.8, bty = "n",
       fill = c("lightblue", "mistyrose", "lightcyan",
                "lavender", "cornsilk"))

#===============================================================================
#-------------------------------------------------------------------------------
##Include legends
#-------------------------------------------------------------------------------
#===============================================================================

legend("topright", c("iphone","android","ipad","ifttt","others"),
       cex = 0.8, bty = "n",
       fill = c("lightblue", "mistyrose", "lightcyan",
                "lavender", "cornsilk"))

head(Number_of_Tweets)

#===============================================================================
