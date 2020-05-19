library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

round(mean(imdb$RevenueMillions),2)

imdb$RevenueMillions <- replace(imdb$RevenueMillions,is.na(imdb$RevenueMillions),82.96)  #Data Handling by replacing NA values with mean

imdbcol <- imdb[c("RuntimeMinutes","RevenueMillions")]
imdbcol

summary(imdbcol)          #summary table

boxplot(imdb$RevenueMillions,main='Box plot of Revenue',xlab='RevenueMillions')

IQR(imdb$RevenueMillions)

sum(imdb$RevenueMillions < 243)

sum(imdb$RevenueMillions > 243)

boxplot(imdb$RuntimeMinutes,main='Box plot of Runtime',xlab='RuntimeMinutes')






