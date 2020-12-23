#############################
### R workshop 7 ###########
### 2020/11      ###########
############################

#Topics:
# ANOVA
# linear regression
############################
rm(list = ls(all = TRUE))
############################

#data input method 1:
#from wide to long , using tidyr package
station1<-c(236,250,252,233,239)
station2<-c(238,239,262,247,246)
station3<-c(220,236,232,243,213)
station4<-c(241,233,212,231,213)

carton <- data.frame(station1,station2,station3,station4)

library(tidyr)
#if run into problem, turn off RStudio and reinstall..
carton.long <- gather(carton, key = "station", value="carton_number")
summary(carton.long)

#data input method 2:
station <- c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4)
carton_number <- c(236,250,252,233,239,238,239,262,247,246,220,236,232,243,213,241,233,212,231,213)
carton2 <- data.frame(station, carton_number)
carton2$station <- as.factor(carton2$station)

summary(carton2)
levels(carton2$station)

#one-way anova
anova(  lm  (  carton_number ~ station, data= carton2)  )

############################
#check assumptions of ANOVA
#############################
#first: normality

res <- residuals(lm(carton_number ~ station, data= carton2))
hist(res)
shapiro.test(res)
#p = 0.3065, larger than 0.05, cannot reject the null  hypothesis
#normality of residuals assumption is met

#second: equal variance
install.packages('car')
library(car)
leveneTest(carton_number ~ station, data = carton.long)

#large p value shows the equal variance assumption is not violated

#What if the assumption of equal variance is violated?
#you might want to run the analysis using oneway.test()
oneway.test(carton_number ~ station, data = carton.long)

carton2$station <- as.numeric(carton2$station)
cor( carton2$station  , carton2$carton_number)
cor.test(carton2$station, carton2$carton_number)

###########################
## linear regression  ###
##########################
#download the dataset from online source or from your own local path
load(url('https://github.com/acsala/R_IntroStatVisuals/blob/master/parenthood.Rdata?raw=true'))
#load("/Users/ruqin/RTeaching/parenthood.rdata")

m <- lm  ( dan.grump ~ dan.sleep, data= parenthood))
m
     # lm (y ~ x, data)
# beta coefficient: -8.94
# each additional hour of sleep that Dan gain will reduce
# his grumpiness by 8.94 units
# intercept: 125.96
# when Dan gets zero hour of sleep, his grumpiness is at 126.96
predict(m)
summary(m)

#note:
#correlation coefficient is different from regression coefficient
cor.test(parenthood$dan.sleep, parenthood$dan.grump)

###########################
## CI of coefficients  ###
##########################

confint(m) # default confience level 0.95
#hand calculation -8.9368 + (-20.85 * 0.4285)
confint(m, level = .99) # or change confience level

###########################
##      R-sqrd     ###
##########################
ss.error <- sum((predict(m) - parenthood$dan.grump)^2)
ss.total <- sum( ((parenthood$dan.grump - mean(parenthood$dan.grump))^2) )
1 - ss.error/ss.total #r-sqrd
#R-sqrd= .816
#means that the predictor (sleep) explains 81.6% of the variance in the outcome (grump)

r <- cor(parenthood$dan.sleep, parenthood$dan.grump)
r^2

###########################
# multiple regression  ###
##########################

m <- lm  ( dan.grump ~ dan.sleep + baby.sleep, data= parenthood)
summary(m)
confint(m)

# check for normality
hist(residuals(m))
# check for multicollinearity issue
library(car)
vif(m)

