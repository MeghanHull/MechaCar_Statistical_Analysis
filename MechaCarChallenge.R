#******************************************************************************
# RICE-VIRT-DATA-PT-05-2022-U-B-MW Module 15 Challenge
#******************************************************************************
# Purpose  := Statisitical analysis of automobile performance with R
# Created  := 2022 Aug 24 18:09:34 UTC (Meghan E. Hull)
# Modified := 2022 Aug 24 23:08:10 UTC (Meghan E. Hull)
# ---------------------------------------------------------------------------------
# Libraries
library(dplyr)
library(tidyverse)

# Input
MechaCar_mpg_df <- read.csv(file='./Resources/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
Suspension_Coil_df <- read.csv(file='./Resources/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#******************************************************************************
# Deliverable 1: Linear Regression to Predict MPG
# ---------------------------------------------------------------------------------
# - Columns in MechaCar_mpg_df [colnames(MechaCar_mpg_df)]
#   [1] "vehicle_length"   "vehicle_weight"   "spoiler_angle" "ground_clearance"
#   [5] "AWD"              "mpg" 
# - Need to use multiple linear regression (y = m1x1 + m2x2 + … + mnxn + b)
# - Compact symbolic form for lm() & glm() formula
# ---------------------------------------------------------------------------------
# 1. Multiple linear regression
MPG_MLR <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = MechaCar_mpg_df)

# 2. Find the p-value and r-squared
summary(MPG_MLR)

#******************************************************************************
# Deliverable 2: Summary Statistics on Suspension Coils
# ---------------------------------------------------------------------------------
# - Columns in Suspension_Coil_df [colnames(Suspension_Coil_df)]
#   [1] "VehicleID"   "Manufacturing_Lot"   "PSI"
# - Need to use group_by() and summarize()
# ---------------------------------------------------------------------------------
# 1. Create the Total Summary
total_summary <- Suspension_Coil_df %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# 2. Summarize by lot
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

#******************************************************************************
# Deliverable 3: T-Tests on Suspension Coils
# ---------------------------------------------------------------------------------
# T-Test assumptions:
# 1. Input data is numerical and continuous.
# 2. Sample data was selected randomly from its population data.
# 3. Input data is considered to be normally distributed.
# 4. Sample size is reasonably large. 
# 5. Variance of the input data should be very similar.
# ---------------------------------------------------------------------------------
# The t.test()function uses:
# - x           : numeric vector of sample data
# - mu          : calculated mean of the population data
# - alternative : specifies whether one-sided (one-tailed) or two-sided (two-tailed)
# - subset      : optional vector specifying a subset of observations to be used
# ---------------------------------------------------------------------------------
# Suspension_Coil_df only has 150 entries, so using entirety instead of sampling
# ---------------------------------------------------------------------------------
# 1. T-Test of entire population
t.test(Suspension_Coil_df$PSI, mu=1500)

# 2. T-Test of each lot
t.test(subset(Suspension_Coil_df,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(Suspension_Coil_df,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(Suspension_Coil_df,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)