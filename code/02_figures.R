## READ IN DATA ####
source("code/01_cleaning.R")

## LOAD PACKAGES ####
library(ggplot2)


## ORGANIZE DATA ####
data_figs = data_clean %>%
  # Update labels for sex to be nicer for figure
  mutate(sex = factor(sex, levels=c("F", "M"), labels=c("female", "male")))


## MAKE FIGURES ####
# Histogram of dependent variable (proportion of 'Page's)
name.plot = ggplot(data_figs, aes(x = prop)) +
  # Make the figure a histogram
  geom_histogram()

# Write figure to a pdf in the 'figures' folder
name.plot


# Histogram of dependent variable (number of 'Page's) - e based log transform
name_loge.plot = ggplot(data_figs, aes(x = prop_loge)) +
  # Make the figure a histogram
  geom_histogram()

# Call figure
name_loge.plot

# Write figure to a pdf in the 'figures' folder
# ggsave("figures/name_loge.plot.pdf")


# Histogram of dependent variable (number of 'Page's) - 10 based log transform
name_log10.plot = ggplot(data_figs, aes(x = prop_log10)) +
  # Make the figure a histogram
  geom_histogram()

# Call plot
name_log10.plot


# Proportion of 'Page's by year (continuous predictor)
year.plot = ggplot(data_figs, aes(x = year, y = prop_log10, colour = sex)) +
  # Make the figure a scatterplot
  geom_point() +
  # Add a regression line, 'lm' call makes it linear regression
  geom_smooth(method="lm") +
  # Add a title
  ggtitle("Proportion of People with\nthe Name 'Page' Over Time") +
  # Customize the x-axis
  xlab("Year") +
  # Customize the y-axis
  ylab("Proportion of People\n(log base 10 transformed)") +
  # Remove dark background
  theme_classic() +
  # Additional paramaters for displaying plot
  theme(text=element_text(size=18), title=element_text(size=18))

# Call plot
year.plot

# Write figure to pdf file in the figures folder: 
ggsave('figures/scatterplot_proportion_year.pdf', dpi = 300)

# Proportion of 'Page's by sex (categorical predictor)
sex.plot = ggplot(data_figs, aes(x = sex, y = prop_log10, fill=sex))+
  geom_boxplot()+
  # choose a design
  theme_classic()+
  # Add a title
  ggtitle("Popularity of the name 'Page' by sex")+
  # Customize the y-axis (with a line break)
  ylab("Proportion of People\nlog base 10 transformed")+
  # Customize the x-axis
  xlab("Sex") +
  # Custom colours for the fill variable (sex)
  scale_fill_manual(values = c("orange", "blue"))+
  # Additional paramaters for displaying plot
  theme(text=element_text(size=10), # text size
        title=element_text(size=12), # text size for title
        legend.position="none") # no legend

# Call plot
sex.plot

# Write figure to pdf file: 
ggsave('figures/boxplot_propotion_by_sex.pdf', dpi = 300)
