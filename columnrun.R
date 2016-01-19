getwd()
setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
#initi
library(NLP)
library(tm)
library(qdap)
library(SnowballC)

#Load the data


docs <- file.path ("/Users/denatahvildari/Desktop/TextAnalysiswithR/methodsections")


columnrun <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/columnrun.txt", what = "character", sep = "\n")


docs <- Corpus(DirSource(docs))

docs <-tm_map(docs, removeWords, stopwords("english"))

docs <- tm_map(docs, tolower)

word.count <- apply_as_df (docs, termco_d, match.string = columnrun)

#conver termco to matrix
mword.count <- termco2mat(word.count)
mz <- mword.count [apply (mword.count, 1, sum) == 0, ]
mnz <- mword.count [apply (mword.count,1, sum) !=0, ]