# movieRecommendation
Movie recommendation system using hybrid techniques like Tag Genome, metadata, and user history.  
Movie Lens data is used for the processing. After calcualting the avg rating of movie recommendations can be provided by the simple query like " avg_ratings %>% arrange(desc(avg_rating)) %>% filter(avg_rating > quantile(avg_rating,.9)) "  
Relevent genome-tags were selected using "PCA" and "Pearson correlation", then these tags were treated as vectors and similar movies were recommended using cosine distances betweem the movies.
