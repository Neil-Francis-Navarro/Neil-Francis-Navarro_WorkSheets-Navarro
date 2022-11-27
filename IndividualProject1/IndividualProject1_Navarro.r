#Neil Francis N. Navarro
#BSIT 2-A

#Individual Project 1

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
trendTweets <- searchTwitter("#tiktok -filter:retweets",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-20",
                             until = "2022-11-24",
                             retryOnRateLimit=120)

trendTweets

#===============================================================================

#Or load the save files
load(file = "trendingTweetsDF.Rdata")
load(file = "tweetsDf.Rdata")

#===============================================================================

#Converting data into dataframe
trendTweetsDF <- twListToDF(trendTweets)
class(trendTweetsDF)
names(trendTweetsDF)
View(trendTweetsDF)
head(trendTweetsDF)[1:5]
head(trendTweetsDF$text)[1:5]

#Saving the data into a file
save(trendTweetsDF,file = "trendingTweetsDF.Rdata")
load(file = "trendingTweetsDF.Rdata")

#===============================================================================

#Checking for missing values in a data frame
sapply(trendTweetsDF, function(x) sum(is.na(x)))

#Subsetting using the dplyr()package
tweetsDF <- trendTweetsDF %>%
  select(screenName,text,created,statusSource)

#saving file as Rdata
save(tweetsDF, file = "tweetsDF.Rdata")
load(file = "tweetsDf.Rdata")

#===============================================================================
#-------------------------------------------------------------------------------
##3. Plot the time series from the date created. with legends.
#-------------------------------------------------------------------------------
#===============================================================================

#plotting time series graph using plot() by rtweet package base on the date created.
ts_plot(tweetsDF, "hours") +
  labs(x = NULL, y = NULL,
       title = "Frequency of tweets with a #tiktok hashtag",
       subtitle = paste0(format(min(tweetsDF$created), "%d %B %Y"), " to ", 
                         format(max(tweetsDF$created),"%d %B %Y")),
       caption = "Data collected from Twitter's REST API via twitteR") + 
  theme_minimal()

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


tweetsDF$tweetSource = sapply(tweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

Source_subset <- subset(tweet_appSource,count >10)

#===============================================================================

dataDF <- data.frame(
  category = tweet_appSource$tweetSource,
  count = tweet_appSource$count
)

dataDF$fraction = dataDF$count / sum(dataDF$count)
dataDF$percentage = dataDF$count / sum(dataDF$count) * 100
dataDF$ymax = cumsum(dataDF$fraction)
dataDF$ymin = c(0, head(dataDF$ymax, n=-1))
dataDF$roundP = round(dataDF$percentage, digits = 2)

#===============================================================================

#plotting using geom_bar() - bar graph
ggplot(tweetsDF[tweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
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
tweet_appScreen <- tweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#convert to Corpus
namesCorpus <- Corpus(VectorSource(tweetsDF$screenName))

#Running the code using the wordcloud()
wordcloud2(data=tweet_appScreen, 
           size=0.8, 
           color='random-light',
           shape = 'pentagon')

#===============================================================================