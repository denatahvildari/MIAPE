getwd()
setwd("/Users/denatahvildari/Desktop/TextAnalysiswithR")
#initi
library(NLP)
library(tm)
library(qdap)
library(SnowballC)

#Load the data


docs <- file.path ("/Users/denatahvildari/Desktop/TextAnalysiswithR/methodsections")

miapeterms <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/miapeterms.txt", what = "character", sep = "\n")

docs <- Corpus(DirSource(docs))

docs <-tm_map(docs, removeWords, stopwords("english"))

docs <- tm_map(docs, tolower)

word.count <- apply_as_df (docs, termco_d, match.string = miapeterms)

#conver termco to matrix
mword.count <- termco2mat(word.count)
mz <- mword.count [apply (mword.count, 1, sum) == 0, ]
mnz <- mword.count [apply (mword.count,1, sum) !=0, ]

#sketch barplot
#colour <- ("slateblue4","blue","slategray1","seashell4","lightpink","maroon1","orangered3","gray8")
mnz <- t(mnz)
mz <- t(mz)
barplot(mz)
barplot(mnz)
plot(mnz)
#?barplot
#index = apply (mword.count == 0, MARGIN =1 , any) 
#mword.count[index, ]

#colnames (MnZ) <- paste ("terms", 1:dim (MnZ) [2], sep="")
#cols <- c ("red","blue","green","maroon1","gray8")
#par(mfrow=c(1,1)

plot<- barplot (mz, main="occurence of terms in method sections", ylab="count", beside=TRUE, xlab="terms",
        col = c ("red","blue","green","maroon1", "gray8"))
legend("right" , rownames (mnz), cex=0.7, 
       fill= cols, horiz=F)

#barplot specification 
barplot (height, width = 1, space = NULL,
        names.arg = NULL, legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
        xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, args.legend = NULL, ...)




#remove_zeros<- function(x)
#{
#  x = mwrod.count[!apply (mword.count == 0, 1, all), ]
#  return(x)
#}



#install.packages("ggplot2")
#library(ggplot2)
#p <- ggplot2(data = mword.count, aes(x = word, y = count))
#layer(geom, geom_params, stat, stat_paramss, data, mapping, position)
#?"ggplot2"


#,"lightpink","maroon1","orangered3","orange","red",
         #"red4","gray29","gray8")

#Plot the result

plot(word.count)
scores(word.count)
plot(scores(word.count))
#counts(word.count)
#plot(counts(word.count))
#p <- proportions(word.count)
#plot(proportions(word.count))


#out <- sapply (docs, termco_d, match.string = miapeterms)
#barplot(out)
#scores(out)
#plot(scores(out))
#counts(out)
#plot(counts(out))
#proportions(out)
#plot(proportions(out))

#ml <- list(
 # miapeterms
#)

#miape <- Corpus (DirSource(miape))
#docs <- tm_map (docs, removeNumbers) 
#docs <- tm_map(docs, PlainTextDocument)

# Stage the Data
#dtm <- DocumentTermMatrix(docs)   

#Exploring the dtm
#freq <- colSums(as.matrix(dtm)) 
#ord <- order(freq)  
#m <- as.matrix(dtm)
#write.csv (m, file="dtm.csv")


#Focus on interesting stuff
#removing sparseterms

#dtms <- removeSparseTerms(dtm, 0.1)

#Wrod frequency

#freq[(ord)] 
#freq <- colSums(as.matrix(dtms))   

# most frequent terms

#findFreqTerms (dtm, lowfreq= 10)
#or

#wf <- data.frame(word=names(freq), freq=freq)
#plot word frequency
#library(ggplot2)   
#p <- ggplot(subset(wf, freq > 10), aes(word, freq))    
#p <- p + geom_bar(stat="identity")   
#p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))   
#p   

#Relationship between terms
#findAssocs(dtm, c("chromatography" , "column"), corlimit=0.90)
#findAssocs(dtm, "column", corlimit=0.50)

#Wordcloud 
#library(wordcloud)
#set.seed(300)   
#wordcloud(names(freq), freq, min.freq=5) 

#Another one 
#set.seed(142)   
#wordcloud(names(freq), freq, max.words=100)   

#Another one with colour
#set.seed(142)   
#wordcloud(names(freq), freq, min.freq=3, scale=c(5, .1), colors=brewer.pal(6, "Dark2")) 

#Clustering by Terms Similarity
#library(cluster) 

#dtmss <- removeSparseTerms(dtm, 0.30) # This makes a matrix that is only 15% empty space, maximum.   
#inspect(dtmss)   
#d <- dist(t(dtmss), method ="euclidian")   
#fit <- hclust(d=d, method ="ward.D")   
#fit  

#Read Dendrogram
#plot.new()
#plot(fit, hang=-1)
#groups <- cutree(fit, k=5)   # "k=" defines the number of clusters you are using   
#rect.hclust(fit, k=5, border="red") # draw dendogram with red borders around the 5 clusters   

#K-means clustering
#library(fpc)   
#d <- dist(t(dtmss), method="euclidian")   
#kfit <- kmeans(d, 7)   
#clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)   

#match phrases to papers and count the occurrence 

#apply_as_df - Apply a tm Corpus as a qdap dataframe. apply_as_df - 
#Apply functions intended to be used on the qdap package's data.frame + sentSplit to a tm Corpus object.

#dfword.count <- data.frame (mword.count)
#library(ggplot)
# the output of the precvious line has is of termco class, here I make a matrix of it. 
#m <- as.matrix (word.count)
#DF<- as.data.frame.list (word.count)
#DF<- as.data.frame (m)
#DFm <- as.matrix (DF)
#p <- ggplot(data = DF, aes(x=Phrases,y=papers1))
#p + geom_point()
# save the output as a csv file 
#a <- mcsv_w(DFm, dir = NULL, open = T, sep = " , ", dataframes = NULL,
#       pos = 1, envir = as.environment(pos))



 

 

 