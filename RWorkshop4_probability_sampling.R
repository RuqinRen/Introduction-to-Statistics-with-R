#############################
### R workshop 4 ###########
### 2020/09      ###########
############################

#Topics:
#correlations
#hand calclation of z score and its corresponding percentile point
#sampling distribution

#############################

############################
#correlations of two vectors
milktea.by.month <- c(20, 100, 200, 50, 135, 200,200, 190, 150,150, 100, 90)
temp.by.month <- c(8,10,14,20,24,28,32,32,27,23,17,11)

#take a look at the corerlation visually
plot(temp.by.month, milktea.by.month)

cor( x = milktea.by.month, y = temp.by.month ) #correlation
cor( x = temp.by.month, y = milktea.by.month) #order does not matter
cov( x = milktea.by.month, y = temp.by.month ) #covariance
# if there are missing values
# cor( x = temp.by.month, y = milktea.by.month, use = "pairwise.complete.obs")

######################
######  poisson  #####
######################
#Poisson is defined by only a single parameter, we only need that parameter
#(λ) lambda in the second argument.

dpois(x= 3, lambda=2) #dpois function for probability AT a given X value
dpois(x= 3, lambda=10)
dpois(1, 1.5)
ppois(q = 2, lambda=1.5) #ppois for probability to the LEFT of a given value

#what about larger than a give X value?
#compare these two results
1-ppois(q= 2, lambda = 1.5)
ppois(q = 4, lambda = 1.5, lower.tail = F)

#################
### normal #####
#################

#simulate a toy dataset
obs = seq(-30, 30, 0.1)
plot(x = obs, y = dnorm(obs, 0, 120),
     col="darkblue", type = "l", xlab ="X value")
#play around with the mean value and the sd value to see how parameters change 
#the shape of the normal curve

#calculate z score from raw data
setwd("/Users/ruqin/RTeaching")
load( "aflsmall.Rdata" )

zscore = (afl.margins - mean(afl.margins))/sd(afl.margins)
zscore
#to calculate a theoretical percentile rank for your data
pnorm( zscore )

#The pnorm function finds the probability for any normal distribution
#pnorm(z-score), get area
pnorm(0.71) #z = 0.71
pnorm(1.65) #z=1.65, corresponding to 0.95 area to the left of this z score, corresponding to 90% of CI
pnorm(1.96) #z=1.96, corresponding to 0.975 area to the left of this z score, corresponding to 95% of CI
pnorm(-1.65)
pnorm(-1.96)
pnorm(1.96) - pnorm(-1.96) # the area between these two z scores = 0.95

#The qnorm function converts an area percentile back to z-score
#qnorm is the inverse of pnorm
#qnorm(area), get z-score

qnorm(0.025) #the 0.025 percent of area from negative infinity to Z-score
qnorm(0.975)

#qnorm could take in several values of areas
#get z scores corresponding to the left 2.5 percent and the left 97.5 percent
qnorm(c(0.025, 0.975))

#be default, the areas are calculated for lower-tail (area to the lft)
#we can do upper-tail too, by setting it to false (calculating area to the right of the z score)
qnorm(0.95, lower.tail = FALSE)
qnorm(0.975, lower.tail = FALSE)
#exactly the same as z = 0.025 and lower tail = true (area to the left)
qnorm(0.025)



# Let's generate three different random samples from the same normal distribution
#rnorm generates observations based on the mean and sd parameters you put in
n20 <- rnorm(20, mean = 70, sd = 5)
n100 <- rnorm(100, mean = 70, sd = 5)
n10000 <-  rnorm(10000, mean = 70, sd = 5)

#this is to make three graphs next to each other
par(mfrow=c(3,1))

# The breaks argument specifies how many bars are in the histogram
hist(n20, breaks = 10)
hist(n100, breaks = 20)
hist(n10000, breaks = 100)


#You can learn more about all of the distribution functions 
#by typing help(Distributions) into the R console
help(Distributions) 

