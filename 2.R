
words <- paste(LETTERS[1:3], letters[1:3], sep = "")
?paste
dat <- data.frame(title = 1:3, text = sapply(1:3, function(x){
  
  paste(sample(unlist(strsplit(words, " ")), 15, TRUE), collapse = " ")
}))
dat$text <- as.character(dat$text)
## solve the problem
 tabs <- sapply(dat$text, function(x){
  table(unlist(strsplit(x, " ")))
}, USE.NAMES = FALSE)
 data.frame(title = sort(rep(1:nrow(dat), 3)), 
             text = sort(rep(rownames(tabs))), 
             freq = c(tabs))
 

 