#find cosine similarity b/w the movies
library(readr)
library(lsa)

nonCorrMov <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/nonCorrMov.csv")

#remove movieid 
nonCorrMov_work <- as.matrix(nonCorrMov[-1])

#take transpose and cosine distance of 1000 movies
res <- cosine(t(nonCorrMov_work[8000:10000,]))

res <- as.data.frame(res)

#add movieid column
res <- cbind(nonCorrMov$movid[8000:(7999+nrow(res))],res)
colnames(res)[1] <- "movId"

#add movieid to the row
colnames(res)[2:ncol(res)] <- nonCorrMov$movid[8000:(7999+nrow(res))]

#write to file
write.csv(file = "movCosine.csv", row.names = F, res)

