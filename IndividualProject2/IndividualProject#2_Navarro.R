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
load(file = "trendingTweetsDF2.Rdata")
load(file = "tweetsDF2.Rdata")

#===============================================================================

#Converting data into dataframe

trendTweetsDF2 <- twListToDF(trendTweets2)

#Saving the data into a file

save(trendTweetsDF2,file = "trendingTweetsDF2.Rdata")

#===============================================================================

##Original Tweets
#Subsetting using the dplyr()package

original <- trendTweetsDF2 %>%
  select(screenName,text,created,statusSource,isRetweet) %>% 
  filter(isRetweet == "FALSE")

save(original, file = "original.Rdata")

# GROUPING THE DATA CREATED. 
original %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

originals <- original %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
originals

mn <- original %>% pull(created) %>% min()
mn 
mx <- original %>% pull(created) %>% max()
mx

#===============================================================================

##Retweets
#Subsetting using the dplyr()package

retweet <- trendTweetsDF2 %>%
  select(screenName,text,created,statusSource,isRetweet) %>% 
  filter(isRetweet == "TRUE")

save(retweet, file = "retweet.Rdata")

# GROUPING THE DATA CREATED. 

retweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

retweets <- retweets %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
retweets

min1 <- retweet %>% pull(created) %>% min()
min1 
max1 <- retweet %>% pull(created) %>% max()
max1



#===============================================================================
#-------------------------------------------------------------------------------
##Plot the retweets and the original tweets using bar graph in vertical manner.
##With legends.
#-------------------------------------------------------------------------------
#===============================================================================

#Original tweets
orig <- ggplot(originals, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "purple")

orig %>% ggplotly()

#===============================================================================

#Retweets
retwt <- ggplot(retweets, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "aquamarine4", high = "yellowgreen")

retwt %>% ggplotly()

#===============================================================================
