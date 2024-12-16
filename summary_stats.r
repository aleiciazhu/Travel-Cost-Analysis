cost_19_df = read_csv("cost_19.csv")
cost_20_df = read_csv("cost_20.csv")
visit_19_df = read_csv("visit_19.csv")
visit_20_df = read_csv("visit_20.csv")

# Merge dataframes to get visits per zip code
cost_19_df = merge(cost_19_df, visit_19_df, by = "zcta")
cost_20_df = merge(cost_20_df, visit_20_df, by = "zcta")

colnames(visit_19_df)[colnames(visit_19_df) == "Zip.Code"] <- "zcta"
colnames(visit_20_df)[colnames(visit_20_df) == "Zip.Code"] <- "zcta"

# Calculate weighted average of travel cost
avg_19 = sum(cost_19_df$travel_cost * cost_19_df$visits) / sum(cost_19_df$visits)
print(avg_19)
avg_20 = sum(cost_20_df$travel_cost * cost_20_df$visits) / sum(cost_20_df$visits)
print(avg_20)
