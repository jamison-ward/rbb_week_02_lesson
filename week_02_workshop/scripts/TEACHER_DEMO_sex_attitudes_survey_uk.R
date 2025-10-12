# DESCRIPTIVE TITLE FOR SCRIPT
# FIRST_NAME LAST_NAME
# Date in YYYY-MM-DD format


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 1. Load packages ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if(!require(pacman)) install.packages("pacman") 
pacman::p_load(tidyverse, here, janitor, esquisse)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 2. Import data ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: Here, use `read_csv()` and `here()` to load in your dataset from 
# the "data" folder.
# The dataset you need should have the same name as your script. 

uk <- read_csv(here("data/TEACHER_DEMO_sex_attitudes_survey_uk.csv"))

# View the first few rows of the data
head(uk)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 3. Create and export a frequency table ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: Using the `tabyl()` function from the {janitor} package, 
# make a frequency table of the `rnssecgp_6` variable (occupation status).
# Then use `write_csv()` and `here()` to save this table in your "outputs" folder.

tabyl(uk, rnssecgp_6)

occupation_table <- tabyl(uk, rnssecgp_6)


write_csv(x = occupation_table, 
          file = here("outputs/uk_occupations.csv"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 4. Create plots to show POINT A & POINT B below, then export these ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: Here, use {esquisse} to generate two {ggplot2} figures that 
# demonstrate each of the POINTS listed below.
# (If you know how to work with ggplot directly, you can skip esquisse).
# Then use the `ggsave()` and `here()` functions to save your plots in the 
# "outputs" folder.

# POINT A : A plurality of respondents are in the 25-34 age group (`agrp` variable).
# POINT B : Among respondents aged 65-74, a large proportion consider religion 
# to be "Fairly important" (`religimp` variable).

# esquisser(uk)

age_religimp <- 
  uk %>%
  ggplot() +
  aes(x = agrp, fill = religimp) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  theme_minimal()

ggsave(plot = age_religimp,
       filename = here("outputs/age_religimp_bar.png")) # can also use jpg


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 5. Submitting your work ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTRUCTION: 
# To submit, save and upload your completed R script to the assignment page. 


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
# This section is only relevant if you finish early or are feeling ambitious. Practice working with ChatGPT for this section.

# INSTRUCTION: For your assigned dataset try to create a single figure or a 
# series of figures to answer the question below:
# -- Among the "agree with opinion" questions (the variables starting with `sn`,
# from `snpres` to `snearly`) which have the largest differences between male 
# and female respondents?

uk %>%
  select(rsex, starts_with("sn")) %>% 
  group_by(rsex) %>% 
  pivot_longer(
    cols = -rsex, 
    names_to = "question", 
    values_to = "answer"
  ) %>% 
  filter(!is.na(answer)) %>% 
  group_by(rsex, question) %>% 
  summarise(proportion_who_agree = mean(answer == "Agree" | 
                                          answer == "Agree strongly"),
            .groups = 'drop') %>% 
  mutate(question = case_when(
    question == "snearly" ~ "Young people today\nstart having sex too early",
    question == "snmedia" ~ "Too much sex\nin the media",
    question == "snsexdrv" ~ "Men have a naturally\nhigher sex drive than women",
    question == "snold" ~ "Natural for people to want\nsex less as they get older",
    question == "snpres" ~ "People are under\npressure to have sex",
    question == "snnolov" ~ "Sex without\nlove is OK",
    TRUE ~ question
  )) %>% 
  pivot_wider(id_cols = question, names_from = rsex, values_from = proportion_who_agree) %>% 
  mutate(diff = Male - Female) %>% 
  mutate(question = fct_reorder(question, diff)) %>% 
  pivot_longer(cols = c("Female", "Male"), values_to = "proportion_who_agree", 
               names_to = "rsex") %>% 
  ggplot() +
  geom_col(aes(x = proportion_who_agree, fill = rsex, y = question), 
           position = "dodge") +
  geom_label(aes(x = proportion_who_agree, y = question, 
                 label = scales::percent(proportion_who_agree)),
             position = position_dodge2(width = 0.9)) +
  scale_fill_brewer(palette = "Set2", 
                    breaks = c("Male", "Female"), 
                    name = "Sex") +
  scale_x_continuous(limits = c(0, 1), 
                     labels = scales::percent, 
                     name = "Percentage of sex who agree or strongly agree",
                     ) + 
  scale_y_discrete(name = "") +
  ggtitle("Proportion Who Agree with Sexual Behavior Statements by Gender") +
  theme_minimal() + 
  theme(axis.text.y = element_text(size = 11, face = "bold"), 
        plot.title = element_text(size = 15, face = "bold", hjust = 0.5),
        plot.title.position = "plot")
