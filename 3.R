Sys.setenv(NOAWT=TRUE)
library(ggplot2)
library(ggthemes)
library(tm)
library(Snowball) 
library(RWeka) 
library(reshape)

# input the raw corpus raw text
# you could read directly from @bfist's source : http://l.rud.is/10tUR65
a = readLines("paper1.txt")

# convert raw text into a Corpus object
# each line will be a different "document"
c = Corpus(VectorSource(a))

# clean up the corpus (function calls are obvious)
c = tm_map(c, tolower)
c = tm_map(c, removePunctuation)
c = tm_map(c, removeNumbers)

# remove common stopwords
c = tm_map(c, removeWords, stopwords())

# remove custom stopwords (I made this list after inspecting the corpus)
c = tm_map(c, removeWords, c("week","report","security","weeks","tuesday","update","team"))

# perform basic stemming : background: http://l.rud.is/YiKB9G
# save original corpus
c_orig = c

# do the actual stemming
c = tm_map(c, stemDocument)
c = tm_map(c, stemCompletion, dictionary=c_orig)

# create term document matrix :
tdm = TermDocumentMatrix(c, control = list(minWordLength = 1))

# remove the sparse terms 
tdm.s = removeSparseTerms(tdm, sparse=0.7)

# we'll need the TDM as a matrix
m = as.matrix(tdm.s)



# convert matri to data frame
m.df = data.frame(m)

# quick hack to make keywords - which got stuck in row.names - into a variable
m.df$keywords = rownames(m.df)

# "melt" the data frame ; 
m.df.melted = melt(m.df)

# not necessary, but I like decent column names
colnames(m.df.melted) = c("Keyword","Post","Freq")

# generate the heatmap
hm = ggplot(m.df.melted, aes(x=Post, y=Keyword)) + 
  geom_tile(aes(fill=Freq), colour="white") + 
  scale_fill_gradient(low="black", high="darkorange") + 
  labs(title="Major Keyword Use Across VZ RISK INTSUM 202 Corpus") + 
  theme_few() +
  theme(axis.text.x  = element_text(size=6))
ggsave(plot=hm,filename="risk-hm.png",width=11,height=8.5)


# sum rows of the tdm to get term freq count
tf = rowSums(as.matrix(tdm))
# we don't want all the words, so choose ones with 10+ freq
tf.10 = subset(tf, tf>=10)

# wimping out and using qplot so I don't have to make another data frame
bf = qplot(names(tf.10), tf.10, geom="bar") + 
  coord_flip() + 
  labs(title="VZ RISK INTSUM Keyword Frequencies", x="Keyword",y="Frequency") + 
  theme_few()
ggsave(plot=bf,filename="freq-bars.png",width=8.5,height=11)