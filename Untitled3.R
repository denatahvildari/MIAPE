# I am facing this error Error 
#{in UseMethod("meta", x) : 
#no applicable method for 'meta' applied to an object of class "character"
#In addition: Warning message:
#  In mclapply(unname(content(x)), termFreq, control) :
#  all scheduled cores encountered errors in user code}

#So here I am doing a test:

#text <- c ("experimental  characterization  acetylated pectins,  differentsources  substrates sugar beet pectin sbp  degree  methylesterification dm    da    extracted  sugar beet pulpand  pectin 
#deesterified  alkali   plant  fungal pectin esterases 
#yield different series  pectins table  sbp modified 
#plant pectin methylesterase ppme yieldedthe pserie
#sbp p p  sbp modified  fungalpectin methylesterase
#fpme yielded  fseries f ffor  bseries sbp  alkali
#deesterified yielding bb b  b partial deacetylation 
#sbp  asodium methylatemethanol solution resulted")

#df <- data.frame(text, stringsAsFactors = FALSE)
#c1 <- Corpus(VectorSource(df$text))
#c1 <- tm_map(c1, tolower)
#c1 <- tm_map(c1, removePunctuation)
#c1 <- tm_map(c1, stemDocument, language = "english")
#c1
#inspect(c1)
