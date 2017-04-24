#selecting optinal cutoff
library(readr)
library(caret)

#movie_cluster <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/movie_cluster.csv")

optimal_cutoff <- function(x)
{
  non_clean_movie <- movie_cluster[,-1]
  
  #calculate the correlation matrix
  correlationMatrix <- cor(non_clean_movie)
  
  # find attributes that are highly corrected
  highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=x)
  
  nonCorrMov <- non_clean_movie[,-highlyCorrelated]
  
  #calculate pca, With parameter scale. = T, we normalize the variables to have standard deviation equals to 1.
  prin_comp <- prcomp(nonCorrMov, scale. = T)
  
  #copy std dev
  std_dev <- prin_comp$sdev
  
  #compute variance
  pr_var <- std_dev ^ 2
  
  #proportion of variance explained
  prop_varex <- pr_var/sum(pr_var)
  
  #plot
  plot(prop_varex, xlab = "Principle Component", ylab = "Proportion of Variance Explained", type = "b", main = paste("Plot for cutoff = ",x))
  
}