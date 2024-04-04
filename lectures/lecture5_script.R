#devtools::install_github("joernih/OEKA201WASMP")
library(OEKA201WASMP)
library(dplyr)
library(lmtest)
library(tseries)
##################################################################################################################
#  [1] "adverticing"   "biler"         "df1"           "elbiler"       "fred_ts"       "icecream"
#  [7] "iris"          "iris (mydata)" "md"            "nb_ts"         "nbjson"        "newcars"
# [13] "tssales"       "usedvw"
##################################################################################################################
### Problems set 3: linear regression ###
# 1. Model specifications
# Markdown syntax
ps3eqmlb <- "price_i=\beta_0+\beta_1 bathrooms_i + u_i"
ps3eqmlc <- "price_i=\beta_0+\beta_1 bathrooms_i+\beta_2 size_i  + u_i"
ps3eqmld <- "price_i=\beta_0+\beta_1 size_i + u_i"
# Formula class objects in R
ps3eqmeb <- price ~ bathrooms
ps3eqmec <- price ~ bathrooms + size
ps3eqmed <- price ~ size
# Markdown syntax
# Formula class objects in R
# 2. Data import and transformations
# Import data
# Data transformations
# 3. Descriptiv statistics (graphical and numerical)
# 4. Model estimations
# 5. Results
##################################################################################################################
### Problems set 5: non-linear regression ###
# 1. Model specifications
# Markdown syntax
ps5eqmeb <- Y~X+X2
ps5eqmed <- Y~X+X2+X3
ps5eqmeh <- lnY ~ lnX
# Formula class objects in R
ps5eqmlb <- "Y_i=\beta_0 + \beta_1 X_i+ \beta_2 X_i^2 + u_i"
ps5eqmle <- "Y_i=\beta_0 + \beta_1 X_i+X \beta_2 X_i^3 + u_i"
ps5eqmlh <- "ln Y_i=\beta_0+\beta_1 ln X_i  + u_i"
# Markdown syntax
# Formula class objects in R
# Formula class objects in R
# 2. Data import and transformations
# 3. Descriptiv statistics (graphical and numerical)
# 4. Model estimations
# 5. Results
##################################################################################################################
### Lecture notes week 12: time series ###
# 1. Model specifications
# Markdown syntax
# Rs formula approach we specify under the estimation phase
## "The AR(1) model"
## "The AR(1) model with drift"
## "The AR(1) model with drift and dummy"
## AR (1)
# Markdown
ln12mar1ndnd <- "sales_t=\\beta_0 + \\beta_1 sales_{t-1} + u_t"
ln12mar1wdnd <- "sales_t=\\beta_0 + \\beta_1 sales_{t-1} + \\gamma t + u_t"
ln12mar1wdwd <- "sales_t=\\beta_0 + \\beta_1 sales_{t-1} + \\gamma t + dq3_t + u_t"
# Formula class objects in R
# 2. Data import and transformations
# 3. Descriptiv statistics (graphical and numerical)
# 4. Model estimations
# 5. Results
###################################################################################################################


