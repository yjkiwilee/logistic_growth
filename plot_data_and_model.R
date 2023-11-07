#Script to plot data and model

library(tidyverse)
library(here) # doesn't work :o)

growth_data <- read_csv("Code/experiment1.csv") # import csv file

logistic_fun <- function(t) { # function for calculating population size at time t under logistic growth
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

N0 <- growth_data[[1,2]] # N when t = 0
  
r <- 1.012e-02 # value for r from fit_linear_model.R
  
K <- 6.000e+10 # value for K from fit_linear_model.R

ggplot(aes(x = t, y = N), data = growth_data) +
  geom_function(fun=logistic_fun, colour="red") +
  geom_point() +
  scale_y_continuous(trans='log10')


