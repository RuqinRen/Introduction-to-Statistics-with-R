#############################
### R workshop 5 ###########
### 2020/09      ###########
############################

#Topics:
#one sample tests
#two sample tests
#(refer to LSWR Ch13, 14)
############################

rm(list = ls(all = TRUE))

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
pnorm(0.71) #z = 0.71
pnorm(1.65) #z=1.65, corresponding to 0.95 area to the left of this z score, corresponding to 90% of CI
pnorm(1.96) #z=1.96, corresponding to 0.975 area to the left of this z score, corresponding to 95% of CI
pnorm(-1.65)
pnorm(-1.96)
pnorm(1.96) - pnorm(-1.96) # the area between these two z scores = 0.95

lower.area <- pnorm( q = -z.score, lower.tail = TRUE )
p.value <- lower.area + upper.area

#equivalent way of getting this result?
p.value <- 2* upper.area
#interpretataion?

##################################
# one sample t-test (unknown population variance, more common)
#################################

grades <- c(50,60,60,64,66,66,67,69,70,74,76,76,77,79,79,81,82,82,85,89)
sd( grades )

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

var(grade_test1)
var(grade_test2)

mean(grade_test1)
mean(grade_test2) #inspection of the two means, test 2 seems larger but we need to test it

t.test(grade_test1, grade_test2, paired = TRUE, alternative = "two.sided")
#notice the ordering
t.test(grade_test2, grade_test1, paired = TRUE, alternative = "two.sided")
t.test(grade_test2, grade_test1, paired = TRUE, alternative = "greater")

##################################
## two-sample: independent samples t-test (equal variance assumed)
#################################
load('/Users/ruqin/RTeaching/harpo.rdata')
table(harpo$tutor)
t.test(grade ~ tutor, data = harpo, var.equal = TRUE)
t.test(grade_test1, grade_test2, var.equal = TRUE)

#################################
#two-sample: independent samples t-test (unequal variance)
#i.e., Welch t-test
#################################
t.test(grade ~ tutor, data = harpo)
t.test(grade_test1, grade_test2)
#the result is changing!
#In real life, I tend to prefer this one
#because almost no one actually believes that the population variances are identical
#that's why R defaults to it
