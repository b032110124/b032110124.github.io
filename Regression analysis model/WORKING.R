# Set working directory
setwd("C:\\Users\\A S U S\\Documents/FYP")

# Load necessary libraries
library(tidyverse)
library(caret)

# Read the dataset
d <- read.csv("Graduate employability.csv")
d
View(d)
str(d)
summary(d)
head(d)
# Data cleaning and preparation
# Handling missing and infinite values for numeric columns
d <- d %>% mutate_all(~ ifelse(!is.finite(.), NA, .)) %>%
  na.omit()

#WORKING
# Split the data into features (X) and target variable (y)
X <- select(d, -working, -YEAR)  # Features
y <- d$working  # Target variable

# Split the data into training and testing sets
set.seed(123)
train_data <- d[1:3, ]
test_data <- d[4, ]

# Build a linear regression model
model <- lm(working ~ ., data = train_data)

# Make predictions on the test set
predictions <- predict(model, newdata = test_data)

# Evaluate the model
mse <- mean((predictions - test_data$working)^2)
rmse <- sqrt(mse)

# Print the root mean squared error (RMSE)
print(paste("Root Mean Squared Error:", round(rmse, 2)))

# Visualize the results
plot(test_data$working, predictions, main = "Actual vs. Predicted of WORKING",
     xlab = "Actual", ylab = "Predicted")
abline(0, 1, col = "red")


# Create a data frame with actual and predicted values
results <- data.frame(Actual = test_data$working, Predicted = predictions)

# Print the results table
print(results)

