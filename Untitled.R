getwd()
library(lda)
library(SnowballC)
library(RColorBrewer
library(ggplot2)
library(Rgraphviz)
library(tm)
install.packages("readPDF")
getReaders()
        
fch<- file.path("/Users/denatahvildari/Desktop/FCH/fchmethods")
fch   
        #Nfile<-file("mTest.txt", "r")
        
length(dir(fch))
dir(fch)
class(fch)       
docs<-Corpus(DirSource(fch))
docs
class(docs)

class(docs[[1]])
inspect(docs[1])
#Install.packages(readPDF)
        #readPDF(engine = c("xpdf", "Rpoppler", "ghostscript", "Rcampdf", "custom"),
        #       control = list(info = NULL, text = NULL)) 
getTransformations()
docs<- tm_map(docs, tolower)
inspect(docs[1])
docs<-tm_map(docs, removeNumbers)
inspect(docs[1])
docs<-tm_map(docs, removePunctuation)
inspect(docs[1])
docs<-tm_map(docs, removeWords, stopwords("english"))
inspect(docs[1])
length(stopwords("english"))
stopwords("english")
        
docs <- tm_map(docs,stripWhitespace)
inspect(docs[1])
library(SnowballC)
docs<- tm_map(docs,stemDocument)
inspect(docs[1])
        
#data(..., list = character(), package = NULL, lib.loc = NULL,
#verbose = getOption("verbose"), envir = .GlobalEnv)
        
        ??DocumnetTermMatrix
library("slam")
corpus <- Corpus(VectorSource(fch.Corpus))
corpus
#dataframe<-data.frame(text=unlist(sapply(corpus, `[`, "content")), 
#stringsAsFactors=F)

DocumentTermMatrix(corpus)
dtm <- DocumentTermMatrix(corpus)
dtm
dim(dtm)
tdm <- TermDocumentMatrix(corpus)
tdm
        
        inspect(dtm[1:200,1:200])
        A term-document matrix (10 terms, 10 documents)
        
        inspect(dtm[1:20, 1:30])
        findFreqTerms(dtm, 1000)
        findAssocs(dtm, "chromatograph", 0.8)
        findAssocs(dtm, "material", 0.8)
        
        dtm.common = removeSparseTerms(dtm, 0.1)
        dim(dtm)
        dim(dtm.common)
        inspect(dtm.common[1:10,1:10])
        
        library(slam)
        dtm.dense <- as.matrix(dtm.common)
        dtm.dense
        
        object.size(dtm.common)
        object.size(dtm.dense)
        
        library(reshape2)
        dtm.dense = melt(dtm.dense, value.name = "count")
        head(dtm.dense)
        
        library(ggplot2)
        ggplot(dtm.dense, aes(x = Docs, y = Terms, fill = log10(count))) +
          +     geom_tile(colour = "black") +
          +     scale_fill_gradient(high="#FF0000" , low="#FFFFFF")+
          +     ylab("") +
          +     theme(panel.background = element_blank()) +
          +     theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
        
        
        inspect(removeSparseTerms(dtm, 0.4))
        inspect(DocumentTermMatrix(docs,
                                   + list(dictionary = c("experiment", "equipment", "sample"))))
        
        inspect(dtm[1, 1000])
        class(dtm)
        
        freq<-colSums(as.matrix(dtm))
        length(freq)
        
        ord <- order(freq)

        # Least frequent terms
        freq[head(ord)]
        
        #Most frequent terms
        freq[tail(ord)]
        
        # Frequency of frequencies.
        head(table(freq), 15)
        
        tail(table(freq), 15)
      
        #Conversion TO Matrix and Save to CSV
        Matrix <- as.matrix(dtm)
        dim(Matrix) 
        
        write.csv(m, file="dtm.csv")
        
        dtms <-removeSpareseTerms(dtm, 0.1)
        
        dim(dtm)
        dtms <- removeSparseTerms(dtm, 0.1)
        dim(dtms)
        
        inspect(dtms)
        
        freq <- colSums(as.matrix(dtms))
        freq
        
        table(freq)
        #################################

        findFreqTerms(dtm, lowfreq=100)
        
        findAssocs(dtm, "data", corlimit=0.75)
        plot(dtm, terms=findFreqTerms(dtm, lowfreq=100)[1:50],
             corThreshold=0.5)
        
        plot(dtm,
             terms=findFreqTerms(dtm, lowfreq=100)[1:50],
             corThreshold=0.1)
        ######################################################################
        freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)
        head(freq, 100)
        
        wf <- data.frame(word=names(freq), freq=freq)
        head(wf)
        
        library(ggplot2)
        p <- ggplot(subset(wf, freq>200), aes(word, freq))
        p <- p + geom_bar(stat="identity")
        p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
        p
        
        #####################
        ########
        dtm(docs)
        
        
        list_freqs <- lapply(dtm$dimnames$Docs, 
                             +function(i) findFreqTerms(dtm[dtm$dimnames$Docs == i], 2, 100)
        L <- list_freqs
        cfun <- function(L) {
          pad.na <- function(x,len) {
            c(x,rep(NA,len-length(x)))
          }
          maxlen <- max(sapply(L,length))
          do.call(data.FRAME,lapply(L,pad.na,len=maxlen))
        }
        
        # convert dtm to matrix
        mat <- as.matrix(dtm)
        
        # make data frame similar to "3 columns 'Terms', 
        # 'Series x', 'Series Y'. With series x and y 
        # having the number of times that word occurs"
        cb <- data.frame(doc1 = mat['127',], doc2 = mat['144',])
        
        # keep only words that are in at least one doc
        cb <- cb[rowSums(cb)  > 0, ]
        tab_freqa <- cfun(L)
        tab_freqa<- cfun(L)
        
        # plot
        require(ggplot2)
        ggplot(cb, aes(doc1, doc2)) +
          geom_text(label = rownames(cb), 
                    position=position_jitter())
        
        # this is the typical method to turn a 
        # dtm into a df...
        df <- as.data.frame(as.matrix(dtm))
        # and transpose for plotting
        df <- data.frame(t(df))
        # plot
        require(ggplot2)
        ggplot(df, aes(X127, X144)) +
          geom_text(label = rownames(df), 
                    position=position_jitter())
        
        dtm.frame <- as.data.frame(t(docTermMatrix))
        
        ##############################################
        #######################
        Topics_Words <- read.csv("C:/Users/Dena/Desktop/output_csv/Topics_Words.csv")
        View(Topics_Words)
        
        p <- ggplot(subset(Topic-Words, freq>20), aes(word, freq))
        p <- p + geom_bar(stat="identity")
        p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
        p
        
        library(wordnet)
        set.seed(123)
        wordcloud(wf)
        
        library(RQDA)
        
        ??cora.
        netMatrix <-matrix(c(splitLine), nrow=1,ncol=3)
        netMatrix
        
        