# Regression analysis for Inyo County
library(tidycensus)
library(tidyverse)
library(zipcodeR)

census_api_key("425aad91b462f2b0a30b2ee56ce3823ef188eef5")

zcta_df = get_acs(
  geography = "zcta",
  variables = "B19013_001",
  year      = 2022)
colnames(zcta_df)[1] <- "zcta"
print.data.frame(head(zcta_df))

zcta_list = as.vector(zcta_df$zcta)

distance_df = zip_distance(zcta_list, "93545")
print.data.frame(head(distance_df))