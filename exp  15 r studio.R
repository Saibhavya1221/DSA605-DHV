d<-data.frame(G=c("M","F","M","F","M","F"),
              H=c(2,3.5,1.5,4,2.8,3),A=c(78,90,70,95,85,92),
              M=c(62,80,55,90,72,82),S=c(65,85,58,92,74,86),
              D=as.Date(c("2025-01-10","2025-01-10","2025-02-12",
                          "2025-02-12","2025-03-15","2025-03-15")))

par(mfrow=c(2,2))
hist(d$M,main="Math Score",xlab="Score")
boxplot(S~G,d,main="Science by Gender",xlab="Gender",ylab="Score")
plot(d$H,d$M,col=ifelse(d$G=="M",1,2),pch=19,
     main="Study Hours vs Math",xlab="Study Hours",ylab="Math Score")
abline(lm(M~H,d))

m<-aggregate(M~format(D,"%m"),d,mean)
plot(m$M,type="o",main="Monthly Math Average",xlab="Month",ylab="Score")