setwd("~/Desktop/TextAnalysiswithR/papers")

#Packages for textmining
library(tm)
#loading in the .txt files and loading in the word list 

papers<- file.path("~/Desktop/TextAnalysiswithR/papers")
papers
#loading terms
terms <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/papers/terms.txt", what="character", sep="\n")
terms
papers<- Corpus(DirSource(papers))

getTransformations()
papers<- tm_map(papers, tolower)
papers<- tm_map(papers, removeNumbers)
papers<-tm_map(papers, removePunctuation)
papers<-tm_map(papers, removeWords, stopwords("english"))

#length(stopwords("english"))
#stopwords("english")
papers <- tm_map (papers, stripWhitespace)

library(SnowballC)
papers<- tm_map(papers,stemDocument)
papers<- tm_map(papers, PlainTextDocument)
class(papers)

library(slam)
dtm <- DocumentTermMatrix(papers)
dtm_m <- as.matrix(dtm)
write.csv(dtm_m, file="dtm.csv")  
dtm_m[,]

column_names = colnames(dtm_m)
print(column_names)

List <- list()
for(i in 1:n)
{
  normF <- #something
    List[[i]] <- normF
}
Matrix = do.call(cbind, List)
#final_matrix = ones(length(terms), length(papers))

for (i in 1:length(terms)){
  
  col_vector[i] = which(column_names == terms)
}


column_names[1878]

dtm_m[,1878]




