getwd()
setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
#initi
library(NLP)
library(tm)
library(qdap)
library(SnowballC)

#Load the data
docs <- file.path ("/Users/denatahvildari/Desktop/TextAnalysiswithR/methodsections")
#load terms for the first category
general <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/general.txt", what = "character", sep = "\n")

#create a corpus
docs <- Corpus(DirSource(docs))

#preprocessing 
docs <-tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, tolower)

word.count <- apply_as_df (docs, termco_d, match.string = general)

#conver termco to matrix
mword.count <- termco2mat(word.count)
mz <- mword.count [apply (mword.count, 1, sum) == 0, ]
mnz <- mword.count [apply (mword.count,1, sum) !=0, ]

rm(mnz)
rm(mz)
