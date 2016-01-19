getwd()
setwd("~/Desktop/TextAnalysiswithR")
getwd()

#LISTS OF PACKAGES 
browseURL("http://cran.r-project.org/web/views/")

#Packages for plot

library(RColorBrewer)
library(ggplot2)
library(reshape2)

#Packages for textmining

library(NLP)
library(tm)
library(SnowballC)
library(slam)

#install.packages("getReaders")
#install.packages("read.csv")
#getReaders()

#loading in the data 
papers <- file.path ("/Users/denatahvildari/Desktop/TextAnalysisWithR/papers")
papers
dir(papers)
#making directory for the existing papers
#text <-scan (choose.files(), what="char", sep="\n")
#paper3 <- read.table("~/Desktop/TextAnalysiswithR/papers/paper3.txt", quote="\"")


#rm("description")
#View("papers")
#str("papers")

#settingup source and corpus
length(dir(papers))
dir(papers)
class(papers)

paper.corpus <- Corpus (DirSource("papers"))
paper.corpus[1]
class(paper.corpus)
summary(paper.corpus)
inspect(paper.corpus)
inspect(paper.corpus[1])

       
#docs<-Corpus(DirSource(papers))
#docs
#class(docs)

#remove values or data
rm(corpus)

#Cleaning

getTransformations()

paper.corpus<- tm_map(paper.corpus, tolower)
inspect (paper.corpus[1])
inspect (paper.corpus[2])
inspect (paper.corpus[3])
inspect (paper.corpus[4])
inspect (paper.corpus[5])

paper.corpus<-tm_map(paper.corpus, removeNumbers)
inspect (paper.corpus[1])
inspect (paper.corpus[2])
inspect (paper.corpus[3])
inspect (paper.corpus[4])
inspect (paper.corpus[5])

paper.corpus<-tm_map(paper.corpus, removePunctuation)
inspect (paper.corpus[1])
inspect (paper.corpus[2])
inspect (paper.corpus[3])
inspect (paper.corpus[4])
inspect (paper.corpus[5])

length(stopwords("english"))
stopwords("english")
paper.corpus <- tm_map (paper.corpus, removeWords, stopwords("english"))
inspect (paper.corpus[1])
inspect (paper.corpus[2])
inspect (paper.corpus[3])
inspect (paper.corpus[4])
inspect (paper.corpus[5])


paper.corpus <- tm_map(paper.corpus, stripWhitespace)
inspect (paper.corpus[1])
inspect (paper.corpus[2])
inspect (paper.corpus[3])
inspect (paper.corpus[4])
inspect (paper.corpus[5])


class(paper.corpus)
class(paper.corpus[1])

#making Term Document MAtrix 

library(slam)
library(RWeka)

TDM <- TermDocumentMatrix (paper.corpus)
TDM

TDM2 <- as.matrix(TDM)
View (TDM2)


?findFreqTerms
fw <- findFreqTerms (TDM, 2, 3)

?findAssocs
findAssocs (TDM, c ("eluent", "sample"), c (0.9, 0.9))


TDM.common = removeSparseTerms (TDM, 0.1)
dim(TDM) 

dim(TDM.common)
inspect (TDM.common[1:10, 1:5])

TDM.dense <- as.matrix (TDM.common)
TDM.dense 

object.size(TDM.common)
object.size(TDM.dense)

library(reshape2)
TDM.dense = melt (TDM.dense, value.name ="count")
head (TDM.dense)

library(ggplot)

ggplot (TDM.dense, aes(x = Docs, y = Terms, fill = log10(count))) +
  +     geom_tile(colour = "white") +
  +     scale_fill_gradient(high="#FF0000" , low="#FFFFFF")+
  +     ylab("") +
  +     theme(panel.background = element_blank()) +
  +     theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())



#finding the most frequent term
frequency <- columns (dtm2)
frequency <- sort(frequency, decreasing=TRUE)



