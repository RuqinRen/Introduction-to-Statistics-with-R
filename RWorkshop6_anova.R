#############################
### R workshop 6-2 ##########
### 2020/10      ###########
############################

#Topics:
#one-way ANOVA
############################
rm(list = ls(all = TRUE))
##################################

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

res <- residuals( lm(carton_number ~ station, data= carton2))
hist(res)
shapiro.test(res)
#p = 0.3065, larger than 0.05, cannot reject the null  hypothesis
#normality of residuals assumption is met

#second: equal variance
install.packages('car')
library(car)
leveneTest(carton_number ~ station, data = carton2)

#large p value shows the equal variance assumption is not violated

#What if the assumption of equal variance is violated?
#you might want to run the analysis using oneway.test()
oneway.test(carton_number ~ station, data = carton.long)


store1<-c(102,106,105,115,112)
store2<-c(97,77,82,80,101)
store3<-c(89,91,75,106,94)
store4<-c(100,116,87,102,100)
hw3.4 <- data.frame(store1,store2,store3,store4)

library(tidyr)
#if run into problem, turn off RStudio and reinstall..
hm3.4long <- gather(hw3.4, key = "store", value="sales")
summary(hm3.4long)

anova(  lm  (  sales ~ store, data= hm3.4long)  )

library(car)
leveneTest(carton_number ~ station, data = carton2)
