setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
#Packages for textmining
library(NLP)
library(tm)
library(qdap)
#Load the papers
papers <- file.path("methoddescription")
# create a corpus of papers 
papers1 <- Corpus(DirSource(papers))
# load the phrases and terms as txt file 
Phrases <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/miapeterms.txt", what="character", sep="\n")
#Find the frequency, raw number of count, rnp, prop for single terms and phrases 
word.freq <- apply_as_df(papers1, termco_d, match.string=Phrases)
word.freq <- termco2mat(word.freq)
word.freq <- data.frame (word.freq)

#Plot the result
plot(word.freq, label = T, lab.digits = 1, percent = T)
plot(word.freq)
scores(word.freq)
plot(scores(word.count))
counts(word.count)
plot(counts(word.count))
p <- proportions(word.count)
plot(proportions(word.count))




p<-plot(word.freq)

library(ggplot2)
# the output of the precvious line has is of termco class, here I make a matrix of it. 
#m <- as.matrix (word.freq)
DF<- as.data.frame.list (word.freq)
DFm <- as.matrix (DF)

# save the output as a csv file 
a <- mcsv_w(word.freq, dir = NULL, open = T, sep = ", ", dataframes = NULL,
            pos = 1, envir = as.environment(pos))
class(termco)
?termco
#plot 
PLOT <-  barplot(DFm)
plott <- matplot(DFm)