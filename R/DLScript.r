# cell 1

setwd("C:/Users/clare.teng/OneDrive - McLaren Technology Group/Misc")
url <- "datatraining.txt"
data = read.table(url, sep = ',',header = TRUE)

# cell 2
X <- head(data)[,2:6]
Y <- head(data)[,7]

# cell 3

X_scaled <- scale(X, center = TRUE, scale = TRUE)

# cell 4

sigmoid <- function(){
  
}

# cell 5

relu <- function(){
  
  return(max(x, 0))
}

# cell 6

derv_relu <- function(){
  
  return(max(x, 0)) # check this definition of returned value 
}

## specify hyperparameters

n_hidden <- 15
epochs <- 1000
learning_rate <- 0.1
n_features <- 5
n_records <- 8143

# creates initial weights
weights_hidden_sd <- 1/(n_features^0.5)
weights_input_hidden <- rnorm(n_features*n_hidden, 0, weights_hidden_sd)
dim(weights_input_hidden) <- c(n_features, n_hidden)
weights_output_hidden <- rnorm(n_hidden, 0, weights_hidden_sd)

last_loss <- 0

## bad R practice use for loops
## nevermind for now
for (e in epochs){
  del_w_input_hidden <- matrix(0, n_features, n_hidden)
  del_w_hidden_output <- matrix(0, n_hidden, 1)
  
    for (i in dim(X_scaled)[1]) {
      hidden_input <- dot(x[,i], weights_input_hidden)
      hidden_output <- sigmoid(hidden_input)
      
      output <- 
        
      error <-
        
      output_error_term <- 
        
      hidden_error <-
        
      hidden_error_term <-
      
      del_w_hidden_output <- del_w_hidden_output + 
        
      del_w_input_hidden <- del_w_input_hidden + 
      
    }
  
  weights_input_hidden <-
  weights_output_hidden <-
  
    if (e %/%(epochs/10) == 0)
      hidden_output <- sigmoid(dot(x, weights_input_hidden))
      out <- dot(hidden_output, weights_hidden_output)
      loss <- mean((out - Y)^2)
      
      if ((last_loss & last_loss) < loss)
        print(paste("Train loss: ", loss, " WARNING - loss increasing", sep = ""))
      else
        print(paste("Train loss: ", loss, sep = ""))
    
      last_loss <- loss
}


## testing model's accuracy

url <- "datatest.txt"
datatest <- read.table(url, sep = ',',header = TRUE)

Xtest <- head(datatest)[,2:6]
Ytest <- head(datatest)[,7]

X_scaled_test <- scale(Xtest, center = TRUE, scale = TRUE)

hidden <- sigmoid(dot(X_test_scaled, weights_input_hidden))
out <- sigmoid(dot(hidden, weights_output_hidden))
predictions <- which(out > 0.5)

accuracy <- mean(which(predictions == Ytest))
print(paste("Prediction accuracy is ", accuracy, sep = ""))