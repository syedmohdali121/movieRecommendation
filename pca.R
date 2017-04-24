#https://www.analyticsvidhya.com/blog/2016/03/practical-guide-principal-component-analysis-python/
library(readr)
movie_cluster <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/movie_cluster.csv")
clean_movie <- movie_cluster[,-1]

#calculate pca, With parameter scale. = T, we normalize the variables to have standard deviation equals to 1.
prin_comp <- prcomp(clean_movie, scale. = T)

#plot the resultant principal components.
biplot(prin_comp,scale = 0)

#copy std dev
std_dev <- prin_comp$sdev

#compute variance
pr_var <- std_dev ^ 2

#proportion of variance explained
prop_varex <- pr_var/sum(pr_var)
prop_varex[1:20]

#plot
plot(prop_varex, xlab = "Principle Component", ylab = "Proportion of Variance Explained", type = "b")

#cumulative plot
plot(cumsum(prop_varex), xlab = "Principle Component", ylab = "Proportion of Variance Explained", type = "b")