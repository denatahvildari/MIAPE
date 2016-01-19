# init
getwd()
setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
    ##Packages for textmining
libs("tm", "plyr", "class")
lapply(libs, require, character.only = TRUE)
# set parameters
options(stringsAsFactor = FALSE)
term <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/miapeterms.txt", what="character", sep="\n")
doc <- file.path("papers")
pathname <- "/Users/denatahvildari/Desktop/TextAnalysiswithR/papers"
# clean text 

cleancorpus  <- function(corpus) {
  corpus.tmp <- tm.tmp(corpus, removePunctuations)
  corpus.tmp <- tm.tmp(corpus, tolower)
  corpus.tmp <- tm.tmp(corpus, removeWords, stopwords("english"))
  return(corpus.tmp)
}

# build TDM

generateTDM <- function (term, path) {
  p.dir <- sprintf("%s%s", path, paper)
  s.cor <- Corpus(DirSource(directory = s.dir, encoding= "ANSI"))
  s.cor.cl <- cleanCorpus (s.cor)
  s.tdm <- TermDocumentMatrix (s.cor.cl)
  
  s.tdm  <- removeSparseTerms(s.tdm, 0.7)
  result <- list (name = term, tdm = s.tdm)
}
tdm <- lapply(paper, generateTDM, path = pathname)

# Match terms




# stack 


#hold-out sample


# model - knn 


# acuuracy 