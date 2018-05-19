####### Twitter Data Collection ##################
install.packages("twitteR")
library(twitteR)
require("twitteR")   
#Connect with Twitter API using below 
options(httr_oauth_cache=T)
consumer_key    = 'pPXUC5Kuqfqznfz9fho0fKdsr'
consumer_secret = 'gKRNHF6kfyLVkRNW2K7VNBgVzFuLMeaSCMXphdVIBlk0fuS9z2'
access_token    = '714389417410961408-oNSBuuuqh8dlsOBRjOZcuHaznEI4ULs'
access_secret   = 'F1vtpYSnDyiKoDIWNdzNnOraMXD6lP4HWeCIYy1bEUDeG'
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

#Search Twitter with any string as 'search.string' 
search.string = "trump"
twitter_recent_trump=searchTwitter(search.string,lang="en",resultType="recent",n=200)
str(twitter_recent_trump)
data <- do.call("rbind", lapply(twitter_recent_trump, as.data.frame))
str(data)
View(data)
#################################################

#Fetch Wikipedia
library(devtools)
install_github("Ironholds/WikipediR")
library(WikipediR)
library(tm.plugin.webmining)
library(stringr)

#Get Wikipedia content
wp_content <- page_content("en","wikipedia",
                           page_name = "India_national_cricket_team")


html <- wp_content$parse$text

#Parse HTML
text=extractHTMLStrip(html)
text=str_replace_all(text,"\n", " ")
text=data.frame(text)