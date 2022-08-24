#******************************************************************************
# RICE-VIRT-DATA-PT-05-2022-U-B-MW Module 15 Challenge
#******************************************************************************
# Purpose  := Statisitical analysis of automobile performance with R
# Created  := 2022 Aug 24 18:09:34 UTC (Meghan E. Hull)
# Modified := 2022 Aug 24 18:14:05 UTC (Meghan E. Hull)
# ---------------------------------------------------------------------------------
# Libraries
library(dplyr)
library(tidyverse)

# Input
MechaCar_mpg_df <- read.csv(file='./Resources/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

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