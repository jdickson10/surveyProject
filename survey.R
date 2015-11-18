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
# 
# number of species vs year
# number of sex vs month
# sex vs weight
# hindfoot_length vs sex

## DM Species vs hindfoot_length

# data parsing step

# filter surveys and select column
speciesDM <- surveys %>%
  filter(species_id == "DM") %>%
  select(hindfoot_length) %>%
  filter(!is.na(hindfoot_length))


# build figure
qplot(hindfoot_length, data=speciesDM, ylab = "Frequency", xlab = "Hindfoot Length", binwidth = 1, geom="histogram")


# filter surveys and select columns
allspecies <- surveys %>%
  select(hindfoot_length, species) %>%
  filter(!is.na(hindfoot_length)) %>%
  filter(!is.na(species))

allspecies %>%
  group_by(species) 

avg <- aggregate(allspecies$hindfoot_length, list(species = allspecies$species), mean)
  
ggplot(data=avg, aes(x=species, y=x, fill=species)) + geom_bar(stat="identity") + scale_fill_grey()


# make figure of average weight/species


## composition of data in sampling


## explore comparisons between variables