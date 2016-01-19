getwd()
text2.v <- scan ("/Users/denatahvildari/Desktop/TextAnalysiswithR/p2.txt", what="character", sep="\n")
text2.v 

start.v <- which (text2.v =="residual")
end.v <- which (text2.v == "conditions")
start.v 
end.v
length(text2.v)
class(text2.v)


#Reprocessing the content 
text2.lower.v <- tolower(text2.v)
text2.lower.v
chrom.words.1 <- strsplit (text2.lower.v, "\\W")
chrom.words.1
class(chrom.words.2)
str(chrom.words.2)
#list to vector using unlist 
chrom.words.2 <- unlist (chrom.words.2)
class(chrom.words.2) 
not.blanks.v <- which (chrom.words.2 != "")
not.blanks.v
not.blanks.v [1:10]

chrom.words.2 <- chrom.words.2[not.blanks.v]
chrom.words.2

chrom.words.2[1:100]
chrom.words.2[1807]

which(chrom.words.2 =="chromatography")

length(chrom.words.2[which(chrom.words.2 == "chromatography")])

length(chrom.words.2)
chromatography.hits.v <- length(chrom.words.2[which(chrom.words.2 == "chromatography")])
total.words.v2 <- length(chrom.words.2)
chromatography.hits.v / total.words.v2










length(unique(chrom.words.1))

chrom.words.freqs <- table(chrom.words.1)
chrom.words.freqs

sorted.chrom.words.freqs <- sort(chrom.words.freqs, decreasing = TRUE)
sorted.chrom.words.freqs

sorted.chrom.words.freqs[1:10]
plot(sorted.chrom.words.freqs[1:10])

plot (sorted.chrom.words.freqs[1:20], type="b", xlab= "Top twenty words", ylab="word count", xaxt="n") 
axis(1,1:20, label=names (sorted.chrom.words.freqs[1:20]))

## Remove unwanted words by subsetting
d[-with(d, which(words == "START" | words == "END")), ]
