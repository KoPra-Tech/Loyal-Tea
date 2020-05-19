library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

imdb_rat <- imdb[c('Genre','Rating')]

imdb_rat <- imdb_rat %>% separate_rows(Genre,sep=';')

str(imdb_rat)

#imdb_rat$Genre <- factor(imdb_rat$Genre)

imdb_rat <- imdb_rat %>% group_by(Genre) %>% summarize(meanRating=round(mean(Rating),1))

imdb_rat <- as.data.frame(imdb_rat)      #final data

pl <- barplot(imdb_rat$meanRating,main='Mean Rating of each Genre',xlab='Genre',ylab='Rating',
              names.arg=imdb_rat$Genre,col='chocolate1',ylim=range(0:8))

text(x = pl, y = imdb_rat$meanRating, labels = imdb_rat$meanRating, pos = 3, cex = 0.9, col = "black")
