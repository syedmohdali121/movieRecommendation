#selecting important feature with the help of correlation
library(readr)
movie_cluster <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/movie_cluster.csv")
non_clean_movie <- movie_cluster[,-1]
library(caret)

#calculate the correlation matrix
correlationMatrix <- cor(non_clean_movie)

# find attributes that are highly corrected
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.4)

# print indexes of highly correlated attributes 
print(highlyCorrelated)

nonCorrMov <- non_clean_movie[,-highlyCorrelated]
nonCorrMov$movid <- movie_cluster$X1
write.csv(file = "nonCorrMov.csv", nonCorrMov, row.names = F)