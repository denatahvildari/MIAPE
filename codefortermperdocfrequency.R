getwd()
setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
#Packages for textmining
library(tm)
library(qdap)
#loading in the .txt files and loading in the word list 
papers <- file.path("papers")

#loading terms
terms <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/terms.txt", what="character", sep="\n")
class(terms)
papers<- Corpus(DirSource(papers))
Phrases <- c("room temperature", "column run")
word.freq <- apply_as_df(papers, termco_d, match.string=Phrases)

getTransformations()
papers<- tm_map(papers, removeNumbers)
papers<-tm_map(papers, removePunctuation)
papers<-tm_map(papers, removeWords, stopwords("english"))

length(stopwords("english"))
stopwords("english")
papers <- tm_map (papers, stripWhitespace)

library(SnowballC)
papers<- tm_map(papers,stemDocument)
papers<- tm_map(papers, PlainTextDocument)

library(slam)
dtm <- DocumentTermMatrix(papers)
dtm_m <- as.matrix(dtm)
write.csv(dtm_m, file="dtm.csv")  

C <-rowSums(as.matrix(dtm_m))
C <- as.matrix(C)
C <- do.call(cbind, replicate (5, C, simplify=FALSE))
C <- do.call(rbind, replicate(10, C, simplify =FALSE))

column_names = colnames(dtm_m)
final_matrix = mat.or.vec(length(terms), length(papers))
for(i in 1:length(terms)){
  col_number = which(column_names == terms[i])
  if (length(col_number) > 0){
  final_matrix[i,] = dtm_m[, col_number]
  }
}
rownames(final_matrix) = terms
final_matrix <- as.matrix(final_matrix)
freq <- final_matrix/C
freq
