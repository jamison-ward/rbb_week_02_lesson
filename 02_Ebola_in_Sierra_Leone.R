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


