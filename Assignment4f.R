library(tidyverse)

imdb <- read.csv('IMDB-Movie-Data.csv',header=TRUE,as.is=TRUE)

imdb$RevenueMillions <- replace(imdb$RevenueMillions,is.na(imdb$RevenueMillions),82.96)  #Data Handling by replacing NA values with mean

imdbcol1 <- imdb[c('Year','RevenueMillions')]

summary(imdbcol1)

tb <- imdbcol1 %>% group_by(Year) %>% summarize(meanRevenue= round(mean(RevenueMillions,na.rm = TRUE),1))

table <- as.data.frame(tb)    #final data

bp <- plot(table$Year,table$meanRevenue,main='Mean Revenue by Year',type='o',xlab = 'Year',ylab = 'Mean revenue',
           col='darkmagenta',ylim=c(0,120))
