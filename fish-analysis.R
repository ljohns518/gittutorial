.libPaths("Volumes/LEJOHNSON/NRES 800/gittutorial/")
library(readr)
library(tidyverse)

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
