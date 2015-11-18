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
pdf("figures/histogram.pdf")
qplot(hindfoot_length, data=speciesDM, ylab = "Frequency", xlab = "Hindfoot Length (mm)", binwidth = 1, geom="histogram")
dev.off()

## mean weight per species
# filter surveys and select columns
allspecies <- surveys %>%
  select(weight, species) %>%
  filter(!is.na(weight)) %>%
  filter(!is.na(species))

# creating a group
allspecies %>%
  group_by(species) 

# creating dataset with average weight per species
avg <- aggregate(allspecies$weight, list(species = allspecies$species), mean)
  
# building bar graph 
pdf("figures/bargraph.pdf")
ggplot(data=avg, aes(x=species, y=x)) + xlab("Species") + ylab("Mean Weight (g)") + geom_bar(stat="identity") + coord_flip()
dev.off()

## weight albigula vs weightmerriami
# filter and select columns
eremicus <- surveys %>%
  filter(species == "eremicus") %>%
  select(species, weight) %>%
  filter(!is.na(weight))

# filter and select for 2002
merriami <- surveys %>%
  filter(species == "merriami") %>%
  select(species, weight) %>%
  filter(!is.na(weight))


# create combined object
combine <- rbind(eremicus, merriami)


# create box plot
pdf("figures/boxplot.pdf")
ggplot(data = combine, aes(x=species, y=weight, fill=species)) + xlab("Species") + ylab("Weight (g)") + geom_boxplot() + scale_fill_discrete(name="p-value 2.2e-16")
dev.off()

# statistical test 
t.test(weight ~ species, data=combine)






