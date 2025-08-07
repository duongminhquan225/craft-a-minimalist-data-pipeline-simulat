# eqmb_craft_a_minimal.R

# Load necessary libraries
library(magrittr)
library(purrr)
library(dplyr)

# Define a function to generate random data
generate_data <- function(n) {
  data.frame(
    id = 1:n,
    var1 = rnorm(n),
    var2 = rnorm(n),
    var3 = rnorm(n)
  )
}

# Define a function to process data (e.g., filter, transform)
process_data <- function(data) {
  data %>% 
    filter(var1 > 0) %>% 
    mutate(var2 = var2 * 2) %>% 
    select(id, var2, var3)
}

# Define a function to visualize data
visualize_data <- function(data) {
  plot(data$var2 ~ data$var3)
}

# Create a data pipeline simulator
pipeline_simulator <- function(n, iterations) {
  for (i in 1:iterations) {
    data <- generate_data(n)
    data <- process_data(data)
    visualize_data(data)
    cat("Iteration", i, "complete\n")
  }
}

# Run the pipeline simulator
pipeline_simulator(100, 5)