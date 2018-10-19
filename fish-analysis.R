.libPaths("Volumes/LEJOHNSON/NRES 800/gittutorial/")
library(readr)
library(tidyverse)
library(gridExtra)
library(grid)
library(cowplot)
library(extrafont)

# reading in fish data
fishData <- read_csv("data/Gaeta_etal_CLC_data.csv")
View(fishData)

# create a new column in data called 'length_cat' where length >= 200 is "big" otherwise small
fishData %>% 
  mutate(length_cat = case_when((length >= 300 ~ "big"),
                                (length < 300 ~ "small"))) -> fishData
head(fishData)

# themes
source("R/themes.R")

# create a histogram with the scale length 
# fill by length category
# facet wrap ~ lenght_cat w/ themes
# invite Chris to this reposetory

ggplot() +
  geom_histogram(data = fishData, aes(x = scalelength, colour = length_cat)) +
  facet_wrap(~ length_cat, nrow = 1) +
  theme_publication() +
  theme(legend.position = "bottom")

