getwd()

text.v <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/p5.txt", what="character", sep="\n")
class(text.v) 
text.v[1]              

#Reprocessing the content 
text.lower.v <- tolower(text.v)
text.lower.v
chrom.words.1 <- strsplit (text.lower.v, "\\W")

str(chrom.words.1)
#list to vector using unlist 
chrom.words.1 <- unlist (chrom.words.1)
class(chrom.words.1) 
not.blanks.v <- which (chrom.words.1 != "")
not.blanks.v
not.blanks.v [1:10]

chrom.words.1 <- chrom.words.1[not.blanks.v]
chrom.words.1


word.hits.v <- length(chrom.words.1[which(chrom.words.1 == "fraction")])
total.words.v <- length(chrom.words.1)
total.words.v
word.hits.v / total.words.v



chrom.words.freqs <- table(chrom.words.1)
chrom.words.freqs
a <- as.matrix(chrom.words.freqs)
a

sorted.chrom.words.freqs <- sort(chrom.words.freqs, decreasing = TRUE)
sorted.chrom.words.freqs

sorted.chrom.words.freqs[1:10]
plot(sorted.chrom.words.freqs[1:10])

plot (chrom.words.freqs, type="b", xlab= "Top ten words", ylab="word count", xaxt="n") 


sorted.chrom.words.freqs

