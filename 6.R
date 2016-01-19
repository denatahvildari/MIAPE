?colSums
freq <- colSums(as.matrix(DTM))
length(freq)

ord <- order(freq)
m <- as.matrix(DTM)
dim(m)
write.csv (m, file= "DTM.csv")

?findFreqTerms
fw <- findFreqTerms (DTM, 50)
fw

?findAssocs
findAssocs (DTM, c ("eluent", "sample"), c (0.9, 0.9))

m <- diag(c(1, 2), nrow=2, byrow=TRUE)

