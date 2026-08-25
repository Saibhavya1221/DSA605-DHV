d<-data.frame(A=c(25,40,55,35,60),BMI=c(22,28,30,26,32),
              BP=c(120,135,145,130,150),C=c(180,210,240,200,260))

pairs(d,main="Health Indicators")
qqnorm(d$C);qqline(d$C)
plot(ecdf(d$C),main="ECDF Cholesterol",xlab="Cholesterol",ylab="F(x)")

m<-colMeans(d)
barplot(m,main="Average Health Indicators",xlab="Indicators",
        ylab="Average",col=1:4)