#NOT.WORKING.YET
# Split the data into features (X) and target variable (y)
X <- select(d, -further.study, -YEAR)  # Features
y <- d$further.study  # Target variable

# Split the data into training and testing sets
set.seed(123)
train_data <- d[1:3, ]
test_data <- d[4, ]

# Build a linear regression model
model <- lm(further.study ~ ., data = train_data)

# Make predictions on the test set
predictions <- predict(model, newdata = test_data)

# Evaluate the model
mse <- mean((predictions - test_data$further.study)^2)
rmse <- sqrt(mse)

# Print the root mean squared error (RMSE)
print(paste("Root Mean Squared Error:", round(rmse, 2)))

# Visualize the results
plot(test_data$further.study, predictions, main = "Actual vs. Predicted of FURTHER STUDY",
     xlab = "Actual", ylab = "Predicted")
abline(0, 1, col = "blue")
