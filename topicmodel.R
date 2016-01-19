getwd()
setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
#initi
library(NLP)
library(tm)
library(qdap)
library(SnowballC)

#Load the data
#docs <- file.path ("papers")

docs <- file.path ("/Users/denatahvildari/Desktop/TextAnalysiswithR/methoddescription")
docs <- Corpus (DirSource(docs))

docs <- tm_map (docs, content_transformer (tolower))
inspect (docs[2])
docs <- tm_map (docs, removePunctuation)
docs <- tm_map (docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- DocumentTermMatrix(docs)
inspect(dtm[1:5, 1:100])

m <- as.matrix(dtm)

findFreqTerms(dtm,50)
findAssocs(dtm, "column", 0.8)


