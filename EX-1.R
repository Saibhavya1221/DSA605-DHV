# Load libraries
library(ggplot2)
library(shiny)

# -----------------------------
# Dataset: Monthly Sales
# -----------------------------
sales_data <- data.frame(
  Month = factor(c("January", "February", "March", "April", "May"),
                 levels = c("January", "February", "March", "April", "May")),
  Sales = c(15000, 18000, 22000, 20000, 23000)
)

# -----------------------------
# Line Chart
# -----------------------------
line_chart <- ggplot(sales_data, aes(x = Month, y = Sales, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 3) +
  labs(title = "Monthly Sales Trend",
       x = "Month",
       y = "Sales (in $)") +
  theme_minimal()

print(line_chart)

# -----------------------------
# Bar Chart (Top-Selling Products)
# -----------------------------
# Sample product data
product_data <- data.frame(
  Product = c("Product A", "Product B", "Product C", "Product D"),
  Sales = c(50000, 65000, 40000, 70000)
)

bar_chart <- ggplot(product_data, aes(x = Product, y = Sales, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Top-Selling Products",
       x = "Products",
       y = "Sales (in $)") +
  theme_minimal()

print(bar_chart)

# -----------------------------
# Scatter Plot (Ad Budget vs Sales)
# -----------------------------
scatter_data <- data.frame(
  AdBudget = c(5000, 7000, 9000, 8000, 10000),
  Sales = c(15000, 18000, 22000, 20000, 23000)
)

scatter_plot <- ggplot(scatter_data, aes(x = AdBudget, y = Sales)) +
  geom_point(color = "darkgreen", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Advertising Budget vs Sales",
       x = "Advertising Budget ($)",
       y = "Sales ($)") +
  theme_minimal()

print(scatter_plot)

# -----------------------------
# Insights (Printed Output)
# -----------------------------
cat("\nINSIGHTS FROM SCATTER PLOT:\n")
cat("- There is a positive relationship between advertising budget and sales.\n")
cat("- As advertising budget increases, sales also tend to increase.\n")
cat("- The linear trend suggests marketing investment impacts revenue growth.\n\n")

# -----------------------------
# Interactive Dashboard (Shiny)
# -----------------------------
ui <- fluidPage(
  titlePanel("Sales Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("product", "Select Product:",
                  choices = product_data$Product)
    ),
    
    mainPanel(
      plotOutput("linePlot"),
      plotOutput("barPlot")
    )
  )
)

server <- function(input, output) {
  
  output$linePlot <- renderPlot({
    ggplot(sales_data, aes(x = Month, y = Sales, group = 1)) +
      geom_line(color = "blue", size = 1) +
      geom_point(color = "red", size = 3) +
      labs(title = "Monthly Sales Trend",
           x = "Month",
           y = "Sales ($)") +
      theme_minimal()
  })
  
  output$barPlot <- renderPlot({
    ggplot(product_data, aes(x = Product, y = Sales, fill = Product)) +
      geom_bar(stat = "identity") +
      labs(title = "Top-Selling Products",
           x = "Product",
           y = "Sales ($)") +
      theme_minimal()
  })
}

# Run the app
shinyApp(ui = ui, server = server)