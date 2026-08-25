d<-data.frame(G=c("M","F","M","F","M","F"),
              S=c(4.5,6,3.2,7.1,2.8,5.4),
              U=c(2.4,3.8,1.6,4.5,1.2,3.1),
              Sa=c(3,5,3,5,2,4))

par(mfrow=c(1,3))

hist(d$S,col=2,main="Screen Time",xlab="Hours")
lines(density(d$S),col=4,lwd=2)

plot(d$U,d$S,pch=19,main="Data Used vs Screen Time",
     xlab="Data Used",ylab="Screen Time")
abline(lm(S~U,d))
cor(d$U,d$S)

m<-aggregate(Sa~G,d,mean)
barplot(m$Sa,names.arg=m$G,col=1:2,main="Avg Satisfaction",
        ylab="Satisfaction")
text(seq_along(m$Sa),m$Sa,round(m$Sa,1),pos=3)