# labour force  dataset
# load my data
library(dplyr)
library(readxl)


?Project_1
# create data object
my_data <- Project_1
# my data structure

my_data %>%
  str()
# summary
my_data %>%
  summary()
# my first observations
my_data %>%
  head()
# assigning row names to object
study= rownames(my_data)

my_data = my_data %>%

mutate(niga =study)
str(my_data)

