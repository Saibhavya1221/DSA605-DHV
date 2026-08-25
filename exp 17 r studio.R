d<-data.frame(E=c(1.5,2,3,2.5,1.8),H=c(110,150,250,200,130),
              F=c(18,15,12,14,17),T=c(180,200,250,220,190),R=c(4,5,5,4,3))

par(mfrow=c(1,3))

vioplot(split(d$F,d$R),names=sort(unique(d$R)),
        main="Fuel Efficiency",xlab="Safety",ylab="km/l")

plot(d$H,d$T,col=d$E,pch=19,main="HP vs Top Speed",
     xlab="Horsepower",ylab="Top Speed")
abline(lm(T~H,d))

heatmap(cor(d),main="Correlation Heatmap")