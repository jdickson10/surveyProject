## survey project in R

# install and load library
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

# download a file
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")
# import file
surveys <- read.csv('data/portal_data_joined.csv')

## ideas of how to parse the data
# weight/species vs year
# weight/species/sex vs year
# species vs weight
# Species vs hindfoot_length
# number of species vs year
# number of sex vs month
# sex vs weight
# hindfoot_length vs sex

## explore distribution of weight for each species

# data parsing step

# build figure


## composition of data in sampling


## explore comparisons between variables