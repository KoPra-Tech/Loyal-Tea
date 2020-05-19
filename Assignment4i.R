library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

imdb$RevenueMillions <- replace(imdb$RevenueMillions,is.na(imdb$RevenueMillions),82.96)  #Data Handling by replacing NA values with mean

imdb_rev <- imdb[c('Genre','RevenueMillions')]

imdb_rev <- imdb_rev %>% separate_rows(Genre,sep=';')

str(imdb_rev)

imdb_rev <- imdb_rev %>% group_by(Genre) %>% summarize(meanRevenue=round(mean(RevenueMillions,na.rm = TRUE),1)) %>% arrange(desc(meanRevenue)) 

imdb_rev <- as.data.frame(imdb_rev)    #final data

bp_rev <- barplot(imdb_rev$meanRevenue, main='Mean Revenue of each Genre',xlab='Genre',ylab='Revenue',
                  names.arg=imdb_rev$Genre,col='chocolate1',ylim=range(0:200),cex.names = 0.9)

text(x = bp_rev, y = imdb_rev$meanRevenue, labels = imdb_rev$meanRevenue, pos = 3, cex = 0.9, col = "black")
