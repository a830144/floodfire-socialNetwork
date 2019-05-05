library(twitteR)
library(httpuv)
consumer_key <- '4uIzbufjdqjxqc2pA2KTssKXZ'
consumer_secret <- 'O40Ec4NYi3vb0kd5xQw2CxFeAfPsjnVm2jf4lH5uc2xQlPV9PI'
access_token <- '1014453924667932672-TnssrO7NSr07LcUqC0ZRQY80XspeM4'
access_secret <- 'cs6zX02SOaWMsD6fpEMEvUhpPpAKF8McYCgJ3w1enwa7u'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
twitterUser <- getUser("CalLutheranSOM")

followers <- twitterUser$$getFollowers() # my followers
followers_df <- twListToDF(followers)
mat = matrix(followers_df$description)
library(tm)
corpus <- (VectorSource(mat))
corpus <- Corpus(corpus)
summary(corpus)



twtrTermDocMatrix <- TermDocumentMatrix(corpus)
which(apply(twtrTermDocMatrix,1,sum)>=30)
twtrTermDocMatrix2 <- removeSparseTerms(twtrTermDocMatrix, sparse = 0.97)

tweet_matrix <- as.matrix(twtrTermDocMatrix2)

distMatrix <- dist(scale(tweet_matrix))
fit <- hclust(distMatrix,method="single")

cutree(fit, k = 1:5)

plot(fit)

















