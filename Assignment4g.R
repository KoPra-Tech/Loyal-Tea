library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

imdb_gen <- imdb[c('Genre','Rating')]

imdb_gen <- imdb_gen %>% select(Genre) %>% separate_rows(Genre,sep=';')

str(imdb_gen)

imdb_gen$Genre <- factor(imdb_gen$Genre)

imdb_gen <- imdb_gen %>% group_by(Genre) %>% summarize(Count=n()) %>% arrange(desc(Count))

imdb_gen <- as.data.frame(imdb_gen)    #final data

summary(imdb_gen)

bp_gen <- barplot(imdb_gen$Count, main='Count of Genre',xlab='Genre',ylab='Count',
                  names.arg=imdb_gen$Genre,col='chocolate1',ylim=range(0:600),cex.names = 0.9)

text(x = bp_gen, y = imdb_gen$Count, labels = imdb_gen$Count, pos = 3, cex = 0.9, col = "black")











