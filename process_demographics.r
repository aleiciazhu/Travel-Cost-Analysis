# Regression analysis for Inyo County
library(tidycensus)
library(tidyverse)

census_api_key("425aad91b462f2b0a30b2ee56ce3823ef188eef5")

# get individual dataframes for median income, total population, total male population, median age, hispanic, white, black, asian
acs_income = get_acs(
  geography = "zcta",
  variables = "B19013_001",
  year      = 2022)
dimensions <- dim(acs_income)
print(dimensions)
colnames(acs_income)[4] <- "median_income"
acs_income <- subset(acs_income, select = -c(1, 3, 5))

acs_total = get_acs(
  geography = "zcta",
  variables = "B01001_001",
  year      = 2022)
# rename estimate column to total_population
colnames(acs_total)[4] <- "total_population"
acs_total <- subset(acs_total, select = -c(1, 3, 5))

acs_male = get_acs(
  geography = "zcta",
  variables = "B01001_002",
  year      = 2022)
colnames(acs_male)[4] <- "male"
acs_male <- subset(acs_male, select = -c(1, 3, 5))

acs_age = get_acs(
  geography = "zcta",
  variables = "B01002_001",
  year      = 2022)
colnames(acs_age)[4] <- "median_age"
acs_age <- subset(acs_age, select = -c(1, 3, 5))

acs_hispanic = get_acs(
    geography = "zcta",
    variables = "B01001I_001E",
    year      = 2022)
colnames(acs_hispanic)[4] <- "hispanic"
acs_hispanic <- subset(acs_hispanic, select = -c(1, 3, 5))

acs_white = get_acs(
    geography = "zcta",
    variables = "B01001H_001E",
    year      = 2022)
colnames(acs_white)[4] <- "white"
acs_white <- subset(acs_white, select = -c(1, 3, 5))

acs_black = get_acs(
    geography = "zcta",
    variables = "B02001_003E",
    year      = 2022)
colnames(acs_black)[4] <- "black"
acs_black <- subset(acs_black, select = -c(1, 3, 5))

acs_asian = get_acs(
    geography = "zcta",
    variables = "B02001_005E",
    year      = 2022)
colnames(acs_asian)[4] <- "asian"
acs_asian <- subset(acs_asian, select = -c(1, 3, 5))

acs_indigenous = get_acs(
    geography = "zcta",
    variables = "B02001_004E",
    year      = 2022)
colnames(acs_indigenous)[4] <- "indigenous"
acs_indigenous <- subset(acs_indigenous, select = -c(1, 3, 5))

# merge dataframes by zcta
dfs <- list(acs_income, acs_total, acs_male, acs_age, acs_hispanic, acs_white, acs_black, acs_asian, acs_indigenous)
acs_df <- Reduce(function(x, y) merge(x, y, by = "NAME"), dfs)
colnames(acs_df)[1] <- "zcta"

# change to percentage of total population for each demographic
acs_df$male <- acs_df$male / acs_df$total_population
acs_df$hispanic <- acs_df$hispanic / acs_df$total_population
acs_df$white <- acs_df$white / acs_df$total_population
acs_df$black <- acs_df$black / acs_df$total_population
acs_df$asian <- acs_df$asian / acs_df$total_population
acs_df$indigenous <- acs_df$indigenous / acs_df$total_population

# remove total population column
acs_df <- subset(acs_df, select = -c(total_population))

# write to csv
write.csv(acs_df, "acs_data.csv", row.names = FALSE)