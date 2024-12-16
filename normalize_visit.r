library(tidyverse)

population_df <- read.csv("population.csv")
visit_19_df <- read.csv("visit_19.csv")
visit_20_df <- read.csv("visit_20.csv")

visit_19_df <- merge(visit_19_df, population_df, by = "zcta")
visit_20_df <- merge(visit_20_df, population_df, by = "zcta")

# 2019 visitation rate
visit_19_df$visits.per.100000 <- visit_19_df$visits / visit_19_df$Population * 100000
write.csv(visit_19_df, "visit_19.csv", row.names = FALSE)

# 2020 visitation rate
visit_20_df$visits.per.100000 <- visit_20_df$visits / visit_20_df$Population * 100000
write.csv(visit_20_df, "visit_20.csv", row.names = FALSE)
