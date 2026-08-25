# Load Libraries
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

# Dataset
data <- data.frame(
  Age = c(25, 30, 35, 28, 40),
  Score = c(4, 5, 3, 4, 5),
  Feedback = c(
    "good service",
    "excellent product",
    "average service",
    "fast delivery",
    "very happy"
  )
)

# 1. Histogram of Age
ggplot(data, aes(x = Age)) +
  geom_histogram(fill = "blue", bins = 5, color = "black") +
  ggtitle("Customer Age Distribution") +
  xlab("Age") +
  ylab("Count")

# 2. Pie Chart of Satisfaction Scores
pie(
  table(data$Score),
  labels = paste("Score", names(table(data$Score))),
  main = "Satisfaction Score"
)

# 3. Stacked Bar Chart
ggplot(data, aes(x = factor(Age), fill = factor(Score))) +
  geom_bar() +
  labs(
    title = "Satisfaction by Age Group",
    x = "Age",
    y = "Count",
    fill = "Score"
  )

# 4. Word Cloud
text <- paste(data$Feedback, collapse = " ")

words <- unlist(strsplit(text, " "))

wordcloud(
  words = words,
  min.freq = 1,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2")
)


