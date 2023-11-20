#NOT.WORKING.YET
# Split the data into features (X) and target variable (y)
X <- select(d, -not.working.yet, -YEAR)  # Features
y <- d$not.working.yet  # Target variable

# Split the data into training and testing sets
set.seed(123)
train_data <- d[1:3, ]
test_data <- d[4, ]

# Build a linear regression model
model <- lm(not.working.yet ~ ., data = train_data)

# Make predictions on the test set
predictions <- predict(model, newdata = test_data)

# Evaluate the model
mse <- mean((predictions - test_data$not.working.yet)^2)
rmse <- sqrt(mse)

# Print the root mean squared error (RMSE)
print(paste("Root Mean Squared Error:", round(rmse, 2)))

# Visualize the results
plot(test_data$not.working.yet, predictions, main = "Actual vs. Predicted",
     xlab = "Actual", ylab = "Predicted")
abline(0, 1, col = "yellow")