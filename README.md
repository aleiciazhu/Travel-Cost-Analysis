# Travel Cost Analysis

This project applies the **Travel Cost Method (TCM)** to estimate the recreational use value of Angeles National Forest and Eldorado National Forest in California before and after the COVID-19 pandemic. The travel cost method is a common technique in environmental economics for valuing non-market ecosystem services using observed visitor behavior.

## Overview

The COVID-19 pandemic significantly impacted outdoor recreation patterns. National forests experienced notable changes in visitation rates during this period. For instance, during Fiscal Year 2020, national forests and grasslands received 168 million visits, an increase of 25 million total site visits from 2019. Most of the visitation increases occurred in dispersed settings, with an estimated 22.5 million additional visits, or about 25% increase. :contentReference[oaicite:0]{index=0}

This analysis aims to quantify these changes by:
- Estimating the economic value of recreational use in both forests before and after the pandemic.
- Understanding how travel costs and demographic factors influenced visitation rates during these periods.
- Providing insights for forest management and policy-making to enhance recreational experiences and resource allocation.

## Features

- **Travel Cost Estimation**: Calculates travel-related expenses based on geographic and demographic data.
- **Demand Modeling**: Uses regression to estimate the impact of travel costs on visit rates.
- **Visualization**: Generates demand curves and regression diagnostics to illustrate findings.

## Prerequisites

- R (>= 4.0)
- Recommended R packages:
  - `tidyverse`
  - `ggplot2`
  - `readr`
  - `dplyr`

## Setup

1. **Clone the repository**:

    ```bash
    git clone https://github.com/aleiciazhu/Travel-Cost-Analysis.git
    cd Travel-Cost-Analysis
    ```

2. **Install dependencies in R**:

    ```r
    install.packages(c("tidyverse", "ggplot2", "readr", "dplyr"))
    ```

## Usage

1. Ensure the following data files are in the root directory:
   - `acs_data.csv`: Demographic data from the American Community Survey (ACS).
   - `visitRate_pre.csv`: Observed visit frequencies before the pandemic.
   - `visitRate_post.csv`: Observed visit frequencies after the pandemic.

2. Run the scripts in the following order:

    ```r
    source("process_demographics.r")     # Clean and structure ACS data
    source("calculate_cost.r")           # Estimate travel costs
    source("normalize_visit.r")          # Normalize visit rate data
    source("get_regression_data.r")      # Join and prepare dataset
    source("perform_regression.r")       # Run regression analysis
    source("summary_stats.r")            # Generate visualizations and stats
    ```

## Repository Structure

- `acs_data.csv` — Demographic inputs
- `visitRate_pre.csv` — Visit rate data before the pandemic
- `visitRate_post.csv` — Visit rate data after the pandemic
- `calculate_cost.r` — Computes travel cost estimates
- `process_demographics.r` — Cleans and formats ACS data
- `normalize_visit.r` — Prepares visit rate data
- `get_regression_data.r` — Joins and filters datasets
- `perform_regression.r` — Runs regressions to model demand
- `summary_stats.r` — Plots and summary statistics
