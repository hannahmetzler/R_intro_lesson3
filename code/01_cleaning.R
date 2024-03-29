## LOAD PACKAGES ####
library(dplyr)
library(readr)

## READ IN DATA ####
data = readr::read_tsv("data/lesson2_data_babynames.txt")
head(data)
glimpse(data)
        
# ##  This dataset was extracted from the package babynames like this: 
# library(babynames)
# data(babynames)
# data = babynames %>%
#   filter(name %in% c("Page", "Ashley", "Hannah", "Florian", "Dominco", "Helena", "Rouven", "Stefanie", "Oona", "Karin", "Prabath", "Teresa", "Caroline", "Karina", "Ahmad", "Charmaine", "Mohammad", "Clarice", "Hanne", "Lav", "Magdalena", "Claudia"))
# readr::write_tsv(data, file = "data/lesson2_data_babynames.txt")

## CLEAN DATA ####
data_clean = data %>%
  # Look at only one name
  filter(name == "Page") %>% 
  # Only look at data from after year 1900
  filter(year > 1900) %>%
  # Only look at data up to the year 2000 
  filter(year <= 2000) 
  # Add log transforms for log base 10
  mutate(prop_log10 = log10(prop))

# Confirm the name you've chosen is there (if it is not the number of rows will be 0)
head(data_clean)

# Double check only one name chosen
xtabs(~name, data_clean)

# Confirm minimum year greater than 1900
min(data_clean$year)

# Confirm maximum year less than or equal to 2000
max(data_clean$year)
