library(tidyverse)
library(readxl)

knitr::opts_chunk$set(echo = TRUE)

#Read in of election Dataset
election_orig <- read.csv("1976-2020-president.csv")
#head(election_orig)

#Summarize Dataset election1
#print(summarytools::dfSummary(election_orig))

#Select Important Data
election1 <- election_orig %>%
  select(year, state_po, office, candidate, party_detailed, writein, candidatevotes, totalvotes)

#Summarize Dataset election2
#print(summarytools::dfSummary(election1))

#pivot_wider by year
election2 <- election1 %>%
  pivot_wider(names_from = state_po,
              values_from = c(office, candidate, party_detailed, writein, candidatevotes, totalvotes)) %>%
  pivot_longer(!year,
               names_to = "office",
               values_to = "candidate")

#Summarize Dataset election2 
print(summarytools::dfSummary(election2))
view(election2)