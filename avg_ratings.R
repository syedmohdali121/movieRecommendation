###calculate mean rating of all movies by user
library("dplyr")
#pos<-1
movieId <- numeric()
title <- character()
genres <- character()
avg_rating <- double()
no_of_user <- numeric()
avg_ratings <- data.frame(movieId = numeric(),title = character(),genres = character(),avg_rating = double(), no_of_user = numeric(), stringsAsFactors = FALSE)
avg_ratings[1,] <- c(122,"Boomerang (1992)","Comedy|Romance",2.862931, 4060)

# for all movies call calculate mean
run_loop <- function(){
  pos <- 2
  for(mov_id in work_movies$movieId)
  {
    #calculate_mean(i)
    mov_num <- select(filter(ratings,movieId == mov_id),rating)
    movieId <- mov_id
    title <- filter(work_movies,movieId == mov_id)$title
    genres <- filter(work_movies,movieId == mov_id)$genres
    avg_rating <- mean(mov_num$rating)
    no_of_user <- nrow(mov_num)
    avg_ratings[pos,] <-  c(movieId,title,genres,avg_rating,no_of_user)
   # print(pos)
    pos <- pos + 1
   # print(avg_ratings)
    if(pos %% 100 == 0)
      print(pos)
    
  }
  write.csv(avg_ratings,file = "avg_ratings.csv")
  print("write done, terminated")
}

