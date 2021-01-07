#############################
###   R workshop 8   #######
### Final Exam Review   ####
############################

# Topics:
# 1. one-sample test (z, t,)
# 2. two-sample test
# 3. one-way ANOVA
# 4. Regression
############################
rm(list = ls(all = TRUE))
############################


##################################
# one sample z-test (known variance from the pouplation)
# it is probably "useless" in real life
# but a convenient stepping stone towards t-test, which is useful
#################################

grades <- c(50,60,60,64,66,66,67,69,70,74,76,76,77,79,79,81,82,82,85,89)
sample.mean <- mean( grades )
N <- length(grades)

# we know that the students from last year has an average score of 67.5, sd of 9.5
# Q: Are this year's students performing the same as last year's?

#hand calculation of z-score
mu.null <- 67.5
sd.true <- 9.5
se <- sd.true / sqrt(N) #standard error of the mean based on population (last year data)
se
z.score <- (sample.mean - mu.null) / se
z.score

#interpretation:
#2.40 is bigger than the critical value of 1.96 that would be required to be significant at  
#α=  .05, but smaller than the value of 2.58 that would be required to be significant at a level of  
#α=  .01.

upper.area <- pnorm( z.score, lower.tail = FALSE)

#The pnorm function finds the probability for any normal distribution
#pnorm(z-score), get an area

lower.area <- pnorm( q = -z.score, lower.tail = TRUE )
p.value <- lower.area + upper.area

#equivalent way of getting this result?
p.value <- 2* upper.area
#interpretataion?

##################################
# one sample t-test (unknown population variance, more common)
#################################

grades <- c(50,60,60,64,66,66,67,69,70,74,76,76,77,79,79,81,82,82,85,89)

t.test(grades, mu = 60, alternative = "two.sided")

t.test(grades, mu = 67.5, alternative = "two.sided")
#t(19)=2.32, p<.05, CI95=[68.00, 77.20]
t.test(grades, mu = 67.5, alternative = "greater")
t.test(grades, mu = 67.5, alternative = "less")


##################################
#two-sample: paired samples t-test
##################################

grade_test1 <- c(77,79,79,81,82,82,85,89)
grade_test2 <- c(78,84,85,81,89,82,90,95)

mean(grade_test1)
mean(grade_test2) #inspection of the two means, test 2 seems larger but we need to test it

t.test(grade_test1, grade_test2, paired = TRUE, alternative = "two.sided")
#notice the ordering
t.test(grade_test2, grade_test1, paired = TRUE, alternative = "two.sided")
t.test(grade_test2, grade_test1, paired = TRUE, alternative = "greater")


##################################
## two-sample: independent samples t-test (equal variance assumed)
#################################
load(' your data path to the harpo dataset')
table(harpo$tutor)

# use ~ when two columsn are from the same data set
t.test(grade ~ tutor, data = harpo, var.equal = TRUE) 
# use a comma to separate the two varible when they are not from the same data set
t.test(grade_test1, grade_test2, var.equal = TRUE) 

#################################
#two-sample: independent samples t-test (unequal variance)
#i.e., Welch t-test
#################################
t.test(grade ~ tutor, data = harpo)
t.test(grade_test1, grade_test2)
#notice how the result is changing!

#################################
# one-way ANOVA
#################################

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

#################################
##### Regression    ####
#################################
load("your data path to the parenthood dataset")

m <- lm  ( dan.grump ~ dan.sleep + baby.sleep, data= parenthood)
summary(m)
confint(m)

# check for normality
hist(residuals(m))
# check for multicollinearity issue
library(car)
vif(m)
