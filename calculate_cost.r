# Regression analysis for Inyo County
library(tidyverse)

# Load csv data
acs_df <- read.csv("acs_data.csv")
permit_df <- read.csv("pdat_wPRISM.csv")
visit_19_df <- read.csv("visit_19.csv")
visit_20_df <- read.csv("visit_20.csv")

# Clean up dataframes
permit_df$Postal.Code <- substr(permit_df$Postal.Code, 1, 5)
acs_df$zcta <- substr(acs_df$zcta, 7, nchar(acs_df$zcta))
visit_29_df <- subset(visit_19_df, select = c(zcta, visits.per.100000))
visit_20_df <- subset(visit_20_df, select = c(zcta, visits.per.100000))
colnames(permit_df)[colnames(permit_df) == "Postal.Code"] <- "zcta"
colnames(visit_19_df)[colnames(visit_19_df) == "Zip.Code"] <- "zcta"
colnames(visit_20_df)[colnames(visit_20_df) == "Zip.Code"] <- "zcta"

# Create cost df with Postal Code and dist columns of permit_df
cost_df = subset(permit_df, select = c(zcta, dist))
cost_df = cost_df[!duplicated(cost_df$zcta), ]
cost_df = cost_df[complete.cases(cost_df), ]
cost_df$travel_time = cost_df$dist / 60  # Assume 60 mph

# Duplicate cost_df for 2019 and 2020
cost_19_df = cost_df
cost_20_df = cost_df

cost_19_df$travel_cost = cost_19_df$dist * 0.21 + cost_19_df$travel_time * 32.88 * 0.33
cost_20_df$travel_cost = cost_20_df$dist * 0.20 + cost_20_df$travel_time * 34.55 * 0.33

write.csv(cost_19_df, "cost_19.csv", row.names = FALSE)
write.csv(cost_20_df, "cost_20.csv", row.names = FALSE)