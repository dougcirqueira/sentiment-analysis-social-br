# TODO Clean tweets and put together recent tweets collected with old ones

library(gdata)

tweets <- read.csv("Twitter_Collection/tweets_institutional_PrefBelem_FINAL_FUSION.csv")

# Filter out RTs and tweets from biased sources
tweets_no_rts <- tweets[which(!startsWith(tweets$Text, "RT") &
                                tweets$UserName != "UFPA_Oficial" &
                                tweets$UserName != "prefeiturabelem" &
                                tweets$UserName != "Curitiba_PMC"), ]

# Filter out checkins
tweets_no_checkins <- tweets_no_rts[which(!startsWith(tweets_no_rts$Text, "I'm at")), ]

write.csv(tweets_no_checkins, 
          file = "final_implementation/data/twitter_data/tweets_institutional_PrefCuritiba.csv",
          row.names=FALSE, na="",quote = T)

test1 <- read.csv("final_implementation/data/twitter_data/tweets_institutional_PrefCuritiba.csv")
