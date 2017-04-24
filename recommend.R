#recommend movies on the basis of cosine distance and collaborative filtering
library(readr)
library(dplyr)
movCosine <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/movCosine.csv")
avg_ratings <- read_csv("D:/Mine/Big Data/Data set/Movie Data Set/ml-latest/ml-latest/avg_ratings.csv")
movCosine <- as.data.frame(movCosine)

get_movie_name <- function(rec_mov_id)
{
  mov <- data.frame(movieId = character(), title = character(), genres = character(), avg_rating = double(), no_of_user = integer() )
  for (i in rec_mov_id)
  {
    #print(avg_ratings %>% filter(movieId == i))
    mov <- rbind(mov,avg_ratings %>% filter(movieId == i))
  }
  print(mov)
}

recommend_movie <- function(x)
{
  mov_name <- avg_ratings %>% select(movieId, title) %>% filter(movieId == x)
  mov_index <- which(grepl(x,movCosine$movId))
  rec_mov_id <- as.integer(colnames(movCosine)[order(movCosine[mov_index,], decreasing = T)[3:7]])
  print("Recommendation for movie ")
  print(paste(mov_name$movieId, mov_name$title))
  get_movie_name(rec_mov_id)
}
