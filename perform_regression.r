regression_19_df <- read.csv("regression_19.csv")
regression_20_df <- read.csv("regression_20.csv")

visitation_model_19 <- lm(formula = visits.per.100000 ~ travel_cost + median_income + male + median_age + hispanic + white + black + asian + indigenous, data = regression_19_df)
# write summary to file
sink("visitation_model_19_summary.txt")
print(summary(visitation_model_19))

visitation_model_20 <- lm(formula = visits.per.100000 ~ travel_cost + median_income + male + median_age + hispanic + white + black + asian + indigenous, data = regression_20_df)
sink("visitation_model_20_summary.txt")
print(summary(visitation_model_20))