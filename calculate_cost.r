# Regression analysis for Inyo County
library(tidycensus)
library(tidyverse)
library(zipcodeR)

# Load csv data
acs_df = read.csv("acs_data.csv")
permit_df = read.csv("pdat_wPRISM.csv")
visit_df = read.csv("visitRate.csv")

# List of all ZCTAs
zcta_df = subset(acs_df, select = c("zcta"))

# create cost df with Postal Code and dist columns of permit_df
cost_df = subset(permit_df, select = c(Postal.Code, dist))
cost_df = cost_df[complete.cases(cost_df), ]
str(cost_df$Postal.Code)

# Calculate travel time, gas cost, and time cost
cost_df$travel_time = cost_df$dist / 60  # Assume 60 mph
cost_df$gas_cost = cost_df$dist * 0.72 # $0.72 per mile
cost_df$time_cost = cost_df$travel_time * 40.02 * 0.33  # California average wage of $40.02

