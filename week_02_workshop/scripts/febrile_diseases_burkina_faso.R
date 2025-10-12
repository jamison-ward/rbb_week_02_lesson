# DESCRIPTIVE TITLE FOR SCRIPT
# FIRST_NAME LAST_NAME
# Date in YYYY-MM-DD format

# REMINDER: Please review the instructions document and teacher demo script.

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 1. Load packages ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if(!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse, here, janitor, esquisse)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 2. Import data ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: Use `read_csv()` and `here()` to import in the Febrile Diseases 
# dataset from the "data" folder.
# HINT: Remember to use the assignment operator to name the data frame.

# *WRITE YOUR CODE HERE*



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 3. Create and export a frequency table ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION 1: Using the `tabyl()` function from the {janitor} package, 
# make a frequency table of the `ims_final_full_classification` variable.
# HINT: Remember to assign the table output to a named R object!

# *WRITE YOUR CODE HERE*



# INSTRUCTION 2: Use `write_csv()` and `here()` to save this table in your 
# "outputs" folder.

# *WRITE YOUR CODE HERE*



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 4. Visualize the data to illustrate two key points ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: Here, use {esquisse} to generate two {ggplot2} figures 
# that demonstrate each of the POINTS listed below.
# (If you know how to work with ggplot directly, you can skip esquisse).


# POINT A: The most common diagnostic classification was bacterial disease.
# Hint: Recommended plot type is a BAR CHART of one variable.

# *WRITE YOUR CODE HERE*



# POINT B: A majority of children five years and older reported abdominal pain.
# Hint: Recommended plot type is a STACKED BAR CHART showing 2 variables.

# *WRITE YOUR CODE HERE*



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 5. Export and save plots ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: Use the `ggsave()` and `here()` functions to save your plots 
# in the "outputs" folder.

# *WRITE YOUR CODE HERE*



##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 6. Present ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: One person from each group will be approached by an instructor 
# and asked to present their work. 

# The selected person will, in about 2 minutes: 
# - Share one of their figures from POINT A or POINT B above, and explain it.
# - (Optional) Share your figure from the BONUS section below.


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## BONUS (optional ungraded work) ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This section is only relevant if you finish early or are feeling ambitious.

# INSTRUCTION: For your assigned dataset, try to create a single figure or a 
# series of figures to answer the question below: 

# -- Which symptom had the most gender variability?

# *WRITE YOUR CODE HERE*


