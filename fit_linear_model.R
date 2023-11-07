#Script to estimate the model parameters using a linear approximation

library(tidyverse)
library(here)

# ===== experiment1.csv ======

growth_data <- read_csv("Code/experiment1.csv")

# Case 1. K >> N0, t is small

# subset data at t<500 where log plot is 'approximately linear'
data_subset1 <- growth_data %>% filter(t<500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# output summary:
# intercept: 6.883e+00
# slope: 1.012e-02
# therefore r is approx. 1.012e-02

# Case 2. N(t) = K

# subset data at t>3000 where log plot has plateaued
data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

# output summary:
# intercept: 6.000e+10