# Ebola Sierra Leone Analysis
# Author: Jamison Ward
# Created: Tue, Oct 07 2025, 21:33:52


# Load Packages -----------------------------------------------------------

if(!require(pacman)) install.packages("pacman")
pacman::p_load(
  tidyverse,  # meta-package
  plotly,
  janitor,
  visdat,
  inspectdf,
  esquisse
)


# Load Data ---------------------------------------------------------------

# To easily import data in tabular form, File -> Import Dataset -> From Text (readr)
# This function uses the readr library to important and optionally format the tabular data
# IMPORTANT: After importing the data, create a new section to load the tabular data into RStudio
#            by copying and pasting the read_csv() command from the Console
# This is especially important when sharing the code with others

ebola_sierra_leone <- read_csv("ebola_sierra_leone.csv")


# Explore Data ------------------------------------------------------------

head(ebola_sierra_leone)  # Preview of first 6 lines of data set
tail(ebola_sierra_leone)  # Preview of last 6 lines of data set

ncol(ebola_sierra_leone)  # Retrieve the number of columns in the data set
nrow(ebola_sierra_leone)  # Retrieve the number of rows in the data set
dim(ebola_sierra_leone)  # Retrieve the number of rows and columns in the data set

summary(ebola_sierra_leone)  # Retrieve a statistical summary of the data set

min(ebola_sierra_leone$date_of_onset)  # Retrieve the first date of onset
max(ebola_sierra_leone$age, na.rm = TRUE)  # Retrieve the maximum age affected
median(ebola_sierra_leone$age, na.rm = TRUE)  # Retrieve median age ignoring NA values

visdat::vis_dat(ebola_sierra_leone)  # Generate a simple visual summary of the data set
                                     # Used a full signifier to call the function

# Categorical Overview of Data Set

cat_summary <- inspect_cat(ebola_sierra_leone)  # Generate a summary of each variable in the data set

show_plot(inspect_cat(ebola_sierra_leone))  # Generate a visual summary of each variable in the data set (nested function)
                                            # Can also accomplish this with show_plot(cat_summary) (object assignment)

cat_summary_plot <- show_plot(inspect_cat(ebola_sierra_leone))

ggplotly(cat_summary_plot)  # Generate an interactive visual summary of each variable in the data set

# Numerical Overview of Data Set

num_summary_plot <- show_plot(inspect_num(ebola_sierra_leone))
num_summary_plot  # Generate a visual summary of numerical variables in the data set
ggplotly(num_summary_plot)  # Generate an interactive visual summary of numerical variables in the data set


# Analyzing Single Variables: Numeric -------------------------------------

ebola_sierra_leone$age  # Access contents of a single column in a data set (vector)

mean(ebola_sierra_leone$age, na.rm = TRUE)  # Calculate mean of non-NA values in age vector
                                            # Bear in mind that this mean is not the mean of the whole data set,
                                            # just the portion of the data set with age data

median(ebola_sierra_leone$age, na.rm = T)

age_vec <- ebola_sierra_leone$age
sd(age_vec, na.rm = T)
min(age_vec, na.rm = T)
max(age_vec, na.rm = T)
summary(age_vec)  # Summary() function does NOT need na.rm = TRUE parameter to ignore NA values when calculating data statistics
length(age_vec)
sum(age_vec, na.rm = T)


# Visualizing Single Variables: Numeric -----------------------------------

# ggplot graphics generally preferred over built-in R graphics

# Built-in R graphics
hist(age_vec)
boxplot(age_vec)

# ggplot (using esquisse)
esquisser(ebola_sierra_leone)  # Opens a GUI to easily create a basic ggplot graphic

# ggplot(ebola_sierra_leone) +
#   aes(x = age, y = sex, fill = sex) +
#   geom_violin(adjust = 0.6) +
#   scale_fill_hue(direction = 1) +
#   labs(title = "This is my first plot") +
#   theme_minimal()

ggplot(ebola_sierra_leone) +
  aes(x = age) +
  geom_histogram(bins = 30L, fill = "#112446") +
  theme_minimal()


# Analyzing Single Variables: Categorical ---------------------------------

ebola_sierra_leone$district
table(ebola_sierra_leone$district)  # Generate a table of a specified categorical variable
tabyl(ebola_sierra_leone$district)  # Generate a nicer table of a specified categorical variable using janitor package
tabyl(ebola_sierra_leone, district)  # A better way to call the tabyl() function
tabyl(ebola_sierra_leone, district, sex)  # Generate a cross-table using tabyl() function


# Visualizing Single Variables: Categorical -------------------------------

# Base R
barplot(table(ebola_sierra_leone$district))

# ggplot (using esquisse)
# esquisser(ebola_sierra_leone)

ggplot(ebola_sierra_leone) +
  aes(x = district, fill = district) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  theme_minimal()


# Lecture Questions -------------------------------------------------------

# When was the first case reported?
min(ebola_sierra_leone$date_of_sample)

# What was the median age of those affected?
median(ebola_sierra_leone$age, na.rm = TRUE)

# Were there more cases in men or women?
tabyl(ebola_sierra_leone, sex)  # There were more cases in women

# What district has the most reported cases?
tabyl(ebola_sierra_leone, district)  # Kailahun had the most cases

# By the end of June 2024, was the outbreak growing or receding?
# esquisser(ebola_sierra_leone)

ggplot(ebola_sierra_leone) +
  aes(x = date_of_onset) +
  geom_histogram(bins = 30L, fill = "#112446") +
  theme_minimal()
 
# The answer is unclear
