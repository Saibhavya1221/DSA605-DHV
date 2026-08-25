# Create Dataset (Run this only once)

df <- data.frame(
  Student_ID = c("L01","L02","L03","L04","L05","L06"),
  Gender = c("Male","Female","Male","Female","Male","Female"),
  Age = c(20,22,19,21,23,20),
  Course = c("R","R","SQL","R","R","SQL"),
  Study_Time = c(3.5,4.2,2.0,5.0,2.5,4.0),
  Videos_Watched = c(12,15,8,18,9,14),
  Quiz_Score = c(78,85,65,92,70,88),
  Login_Date = c("2025-01-05","2025-01-05",
                 "2025-02-08","2025-02-08",
                 "2025-03-12","2025-03-12")
)
# Dataset
data <- data.frame(
  Course=c("R","R","SQL","R","R","SQL"),
  Quiz_Score=c(78,85,65,92,70,88)
)

# Histogram
hist(data$Quiz_Score,
     main="Quiz Score",
     xlab="Score",
     col="skyblue")

# Boxplot
boxplot(Quiz_Score~Course,
        data=data,
        main="Quiz Score by Course",
        xlab="Course",
        ylab="Score",
        col=c("orange","green"))
symbols(df$Study_Time,
        df$Quiz_Score,
        circles=df$Videos_Watched/5,
        inches=0.3,
        bg=rgb(0,0,1,0.5),
        xlab="Study Time",
        ylab="Quiz Score",
        main="Study Time vs Quiz Score")
df$Login_Date <- as.Date(df$Login_Date)
df$Month <- format(df$Login_Date,"%Y-%m")

avg <- aggregate(Quiz_Score ~ Month, data=df, mean)

plot(avg$Quiz_Score,
     type="o",
     xaxt="n",
     xlab="Month",
     ylab="Average Quiz Score",
     main="Monthly Average Quiz Score")

axis(1, at=1:nrow(avg), labels=avg$Month)

ma <- stats::filter(avg$Quiz_Score, rep(1/2,2), sides=1)
lines(ma, col="red", lwd=2)

