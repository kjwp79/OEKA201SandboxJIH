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
# Import data
HousePrice <- OEKA201WASMP::HousePrice
head(HousePrice,5)
# names(advertising)
# Data transformations
# Data transformations
data_ps3 <- HousePrice %>%
  # Take out the data
  dplyr::select(price,bathrooms,size)
head(data_ps3)
# View the 10 first observations
# 3. Descriptiv statistics (graphical and numerical)
pairs(data_ps3)
summary(data_ps3)
cor(data_ps3)
# 4. Model estimations
# ps3eqmeb
estps3ex1b <- lm(ps3eqmeb, data=data_ps3)
estps3ex1c <- lm(ps3eqmec, data=data_ps3)
estps3ex1d <- lm(ps3eqmed, data=data_ps3)
# 5. Results
broom::tidy(summary(estps3ex1b))
broom::tidy(summary(estps3ex1c))
broom::tidy(summary(estps3ex1d))
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
# Import data
adverticing <- OEKA201WASMP::adverticing
# Data transformations
data_ps5 <- adverticing %>%
  dplyr::select(impress,adexp) %>%
  # We can insert comments her
  dplyr::rename(Y=impress) %>%
  dplyr::rename(X=adexp) %>%
  # We can insert comments her
  dplyr::mutate(X2=X*X) %>%
  dplyr::mutate(X3=X*X*X) %>%
  dplyr::mutate(lnX=log(X)) %>%
  dplyr::mutate(lny=log(Y))
# View the 10 first observations
head(data_ps5,n=5)
# 3. Descriptiv statistics (graphical and numerical)
pairs(data_ps5)
summary(data_ps5)
cor(data_ps5)
# 4. Model estimations
estps5ex1b <- lm(Y~X+X2, data=data_ps5)
estps5ex1e <- lm(Y~X+X2+X3, data=data_ps5)
estps5ex1h <- lm(Y~X+X2, data=data_ps5)

# 5. Results
broom::tidy(summary(estps5ex1b))
broom::tidy(summary(estps5ex1e))
broom::tidy(summary(estps5ex1h))
broom::glance(summary(estps5ex1b))
broom::glance(summary(estps5ex1e))
broom::glance(summary(estps5ex1h))

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
library(ggplot2)
vvar <- names(data_lc12)
ggplot(data_lc12,aes_string(x = "Year", y = vvar[2])) + geom_point() + theme_classic()
# 4. Model estimations
# 5. Results
###################################################################################################################

library(chatgpt)
library(OEKA201WASMP)
library(OEKA201Assignment)
library(dplyr)
library(lmtest)
library(urca)
library(tseries)
library(broom)
library(ggplot2)
library(forecast)
# home/joernih/teaching/OEKA201ProgrammingWebPage/case/ex1_linear/PS3.pdf
# file:///home/joernih/teaching/OEKA201ProgrammingWebPage/case/ex1_linear/PS3.pdf
# file:///home/joernih/teaching/OEKA201ProgrammingWebPage/case/ex2_nonlinear/PS5.pdf
# file:///home/joernih/teaching/OEKA201ProgrammingWebPage/case/ex3_timeseries/OKA201-Week12-slides.pdf
##################################################################################################################
data(package="OEKA201WASMP")$results[,3]
#  [1] "adverticing"   "biler"         "df1"           "elbiler"       "fred_ts"       "icecream"     
#  [7] "iris"          "iris (mydata)" "md"            "nb_ts"         "nbjson"        "newcars"      
# [13] "tssales"       "usedvw"       
##################################################################################################################
### Problems set 3: linear regression ###
# 1. Model specifications
# Markdown syntax
ps3eqmlb <- "price_i=\\beta_0+\\beta_1 bathrooms_i + u_i"
ps3eqmlc <- "price_i=\\beta_0+\\beta_1 bathrooms_i+\\beta_2 size_i  + u_i"
ps3eqmld <- "price_i=\\beta_0+\\beta_1 size_i + u_i"
# Formula class objects in R
ps3eqmeb <- price ~ bathrooms
ps3eqmec <- price ~ bathrooms + size
ps3eqmed <- price ~ size
# 2. Data import and transformations
# Import data
HousePrice <- OEKA201WASMP::HousePrice
# Data transformations
data_ps3 <- HousePrice   %>% 
	dplyr::select(price,bathrooms,size)
# 3. Descriptiv statistics (graphical and numerical)
pairs(data_ps3)
summary(data_ps3)
cor(data_ps3)
# 4. Model estimations
estps3ex1b <- lm(ps3eqmeb, data=data_ps3)
estps3ex1c <- lm(ps3eqmec, data=data_ps3)
estps3ex1d <- lm(ps3eqmed, data=data_ps3)
# 5. Results
summary(estps3ex1b)
summary(estps3ex1c)
summary(estps3ex1d)
##################################################################################################################
### Problems set 5: non-linear regression ###
# 1. Model specifications
# Markdown syntax
ps5eqmeb <- Y~X+X2
ps5eqmed <- Y~X+X2+X3
ps5eqmeh <- lnY ~ lnX
# Formula class objects in R
ps5eqmlb <- "Y_i=\\beta_0 + \\beta_1 X_i+ \\beta_2 X_i^2 + u_i"
ps5eqmle <- "Y_i=\\beta_0 + \\beta_1 X_i+X \\beta_2 X_i^3 + u_i"
ps5eqmlh <- "ln Y_i=\\beta_0+\\beta_1 ln X_i  + u_i"
# 2. Data import and transformations
data_ps5 <-adverticing %>%
  dplyr::select(impress,adexp) %>%
  dplyr::rename(Y=impress) %>%
  dplyr::rename(X=adexp) %>%
  dplyr::mutate(X2=X*X) %>%
  dplyr::mutate(X3=X*X) %>%
  dplyr::mutate(lnX=log(X)) %>%
  dplyr::mutate(lny=log(Y))
# 3. Descriptiv statistics (graphical and numerical)
pairs(data_ps5)
summary(data_ps5)
cor(data_ps5)
# 4. Model estimations
estps5ex1b <- lm(Y~X+X2, data=data_ps5)
estps5ex1e <- lm(Y~X+X2+X3, data=data_ps5)
estps5ex1h <- lm(Y~X+X2, data=data_ps5)
# 5. Results
summary(estps3ex1b)
summary(estps3ex1c)
summary(estps3ex1d)
##################################################################################################################
### Lecture notes week 12: time series ### 
# 1. Model specifications
#! change later
ps5eqmeb <- c(Y ~ X + X2)
# Markdown
ln12mar1ndnd <- "sales_t=\\beta_0 + \\beta_1 sales_{t-1} + u_t"
ln12mar1wdnd <- "sales_t=\\beta_0 + \\beta_1 sales_{t-1} + \\gamma t + u_t"
ln12mar1wdwd <- "sales_t=\\beta_0 + \\beta_1 sales_{t-1} + \\gamma t + dq3_t + u_t"
# 2. Data import and transformations
tssales <- OEKA201WASMP::tssales

s_dat <- as.Date("2001-01-01")  # Startdato
e_dat <- as.Date("2006-01-01")    # Sluttdato
v_dat <- seq(s_dat, e_dat, by = "year")
# Data transformations
data_lc12  <- as.data.frame(tssales) %>%
	# Initial dataset from Bjørnar
	dplyr::select(price,sales) %>%
	#! Hack
        #mutate(Value = ifelse(ID == 3, 35, Value))
	# Creating data variable
        dplyr::mutate(Year=v_dat) %>%
	# Creating index variable t
        dplyr::mutate(t=row_number()) %>%
	# Can insert comments here
	dplyr::mutate(dsales=sales-dplyr::lag(sales)) %>%
	dplyr::mutate(dprice=price-dplyr::lag(price)) %>%
        dplyr::mutate(dm1= ifelse(t %in% c(1,2,3),1,0)) %>%
	dplyr::select(Year,t,sales,price,dsales,dprice)

# Descriptive
# 3. Descriptiv statistics (graphical and numerical)
## Graphical
vvar <- names(data_lc12)
ggplot(data_lc12,aes_string(x = "Year", y = vvar[2])) + geom_point() + theme_classic()
adf.test(data_lc12$sales)
adf.test(data_lc12$price)
# 4. Model estimations
data_lc12_tsoa <- ts(data_lc12$sales,start="2001")
dmv <- data_lc12$dm1 
###  "The AR(1) model"
ar1ndnd_model <- ar(data_lc12_tsoa, method = "ols", aic = FALSE, order.max = 1)
###  "The AR(1) model with drift"
ar1wdnd_model <- arima(data_lc12_tsoa, order = c(1, 0, 0), include.mean = TRUE)
summary(ar1d_model)
###  "The AR(1) model with drift and dummy"
ar1wdwd_model <- arima(data_lc12_tsoa, order = c(1, 0, 0), include.mean = TRUE,xreg = dmv)
summary(ar1wdwd_model)
# 5. Results
predict(ar1ndnd_model, n.ahead = 2)
predict(ar1wdnd_model, n.ahead = 2)
predict(ar1wdwd_model, n.ahead = 2)
#tsar2 <- arima(tsobj, order = c(1, 0, 0), include.mean = TRUE)
###################################################################################################################
