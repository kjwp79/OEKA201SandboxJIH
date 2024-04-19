###################################################################################################################
library(dplyr)
library(broom)
###################################################################################################################
## Assign dataset for exercise to variable usedvw
usedvw <- OEKA201Assignment::usedvw
names(usedvw)
###################################################################################################################
## Settings
decm <- 3 # decimals
###################################################################################################################
## Exercise 1: ###
# 1. Model specifications
# Markdown syntax
ex1mod1la <- "price_i=\\beta_0+\\beta_1 mileage_i + u_i"
ex2mod1la <- "price_i=\\beta_0+\\beta_1 mileage_i+ \\beta_2 mileage_i^2 + u_i"
# Formula class objects in R
ex1mod1ro <- price ~ mileage
ex2mod1ro <- price ~ mileage+mileage2
# 2. Data import and transformations
# Import data
selusedvw <- usedvw %>%
	dplyr::select(price,mileage) %>%
	dplyr::mutate(mileage2=mileage*mileage)
# Data transformations
# 3. Descriptiv statistics (graphical and numerical)
descsum <- summary(usedvw)
desccor <- cor(usedvw)
# 4. Model estimations
esm1 <- lm(ex1mod1ro,data=selusedvw)
esm2 <- lm(ex2mod1ro,data=selusedvw)
# 5. Results
## Estimations
## Mod 1
tidres1 <- broom::tidy(esm1)
glares1 <- broom::glance(esm1)
## Mod 2
tidres2 <- broom::tidy(esm2)
glares2 <- broom::glance(esm2)
## Predictions
insv <- as.vector(summary(usedvw$mileage)[c(1,3,4,6)])
dfi <- data.frame(mileage=c(insv),mileage2=insv^2)
### Model 1
pred_1 <- round(predict(esm1, newdata=dfi),decm)
### Model 1
pred_2 <- round(predict(esm2,newdata=dfi),decm)
##################################################################################################################
