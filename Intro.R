
statedat <- read.csv("StateSAT.csv", header=TRUE, sep=';')
statedat

summary(statedat)

is.na(statedat$teacherpay)

ls()

class(statedat)

nrow(statedat)

ncol(statedat)

dim(statedat)

names(statedat)

colnames(statedat)

head(statedat)

tail(statedat)

length(statedat$states)

sort(statedat$population, decreasing = TRUE)

mean(statedat$population)

round(mean(statedat$population),digits=3)

fivenum(statedat$satmath)

hist(statedat$population, breaks= 25, xlab = 'State Populations', col='yellow')

plot(statedat, main="Plot of all items")

cor(statedat$satmath, statedat$satverbal)

cor.test(statedat$satmath, statedat$satverbal)
