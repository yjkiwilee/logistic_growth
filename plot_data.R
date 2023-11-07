#Script to plot the logistic growth data

library(tidyverse)
library(here)

# ===== start with experiment1.csv =====

growth_data <- read.csv("Code/experiment1.csv") # import data, may need to change directory depending on working directory..

ggplot(aes(t,N), data = growth_data) + # plot data as scatterplot
  geom_point() +
  xlab("t") +
  ylab("N") +
  theme_bw()

ggplot(aes(t,N), data = growth_data) + # plot data on log scale
  geom_point() +
  xlab("t") +
  ylab("N") +
  scale_y_continuous(trans='log10')
