library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

imdb$RevenueMillions <- replace(imdb$RevenueMillions,is.na(imdb$RevenueMillions),82.96)  #Data Handling by replacing NA values with mean

plot(imdb$Rank,imdb$RevenueMillions,main='Plot between Rank and Revenue')

cor(imdb$Rank,imdb$RevenueMillions,use = 'all.obs')
