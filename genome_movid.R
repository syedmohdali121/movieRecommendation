library(readr)
library(dplyr)
genome_scores <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/genome-scores.csv")
genome_movid <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/genome_movid.csv")
#genome_scores[i,genome_scores$tagId+1] <- genome_scores$relevance
count <- 0
tag_id <- 1
tag_id_counter <- 1
for(i in  seq(genome_scores$movieId))
{
  count <- count + 1
 
  genome_movid[tag_id,tag_id_counter + 1] <- format(round( genome_scores[count,3],4), nsmall = 4)
  tag_id_counter <- tag_id_counter + 1
  if(tag_id_counter > 1128)
  {
    tag_id_counter <- 1
    tag_id <- tag_id + 1
  }

 
}
print("generation complete, writing csv now")
write.csv(genome_movid,file = "movie_cluster.csv")