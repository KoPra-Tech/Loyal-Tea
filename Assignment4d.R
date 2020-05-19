library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

imdb$RevenueMillions <- replace(imdb$RevenueMillions,is.na(imdb$RevenueMillions),82.96)  #Data Handling by replacing NA values with mean

plot(imdb$Rating,imdb$RuntimeMinutes,main='Plot between Rating and Runtime')

cor(imdb$Rating,imdb$RuntimeMinutes)


