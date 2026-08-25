d<-data.frame(A=c(19,21,20,22,23),H=c(12,8,15,10,7),
              At=c(90,70,95,85,60),T=c(85,70,92,80,65),P=c(8,7,9,8,6))

par(mfrow=c(2,2))

plot(d$T,type="o",col=1,ylim=c(0,100),main="Scores",
     xlab="Students",ylab="Score")
lines(d$P,type="o",col=2)
legend("topleft",c("Test","Participation"),col=1:2,lty=1)

d$Q<-cut(d$At,quantile(d$At,c(0,.25,.5,.75,1)),
         labels=1:4,include.lowest=T)
boxplot(H~Q,d,col=1:4,main="Study Hours by Attendance",
        xlab="Attendance Quartile",ylab="Study Hours")

plot(density(d$T),main="Test Score Density",xlab="Test Score")