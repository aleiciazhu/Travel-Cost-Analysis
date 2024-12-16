acs_df <- read.csv("acs_data.csv")
permit_df <- read.csv("pdat_wPRISM.csv")
visit_19_df <- read.csv("visit_19.csv")
visit_20_df <- read.csv("visit_20.csv")
cost_19_df <- read.csv("cost_19.csv")
cost_20_df <- read.csv("cost_20.csv")

# Clean up dataframes
permit_df$Postal.Code <- substr(permit_df$Postal.Code, 1, 5)
acs_df$zcta <- substr(acs_df$zcta, 7, nchar(acs_df$zcta))
visit_29_df <- subset(visit_19_df, select = c(zcta, visits.per.100000))
visit_20_df <- subset(visit_20_df, select = c(zcta, visits.per.100000))
colnames(permit_df)[colnames(permit_df) == "Postal.Code"] <- "zcta"
colnames(visit_19_df)[colnames(visit_19_df) == "Zip.Code"] <- "zcta"
colnames(visit_20_df)[colnames(visit_20_df) == "Zip.Code"] <- "zcta"

# Merge dataframes
regression_19_df = merge(cost_19_df, acs_df, by = "zcta")
regression_19_df = merge(regression_19_df, visit_19_df, by = "zcta")

regression_20_df = merge(cost_20_df, acs_df, by = "zcta")
regression_20_df = merge(regression_20_df, visit_20_df, by = "zcta")

write.csv(regression_19_df, "regression_19.csv", row.names = FALSE)
write.csv(regression_20_df, "regression_20.csv", row.names = FALSE)