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
  esquisse
)

# To easily import data in tabular form, File -> Import Dataset -> From Text (readr)
# This function uses the readr library to important and optionally format the tabular data
# IMPORTANT: After importing the data, create a new section to load the tabular data into RStudio
  # This is especially important when sharing the code with others


# Load Data ---------------------------------------------------------------

ebola_sierra_leone <- read_csv("ebola_sierra_leone.csv")