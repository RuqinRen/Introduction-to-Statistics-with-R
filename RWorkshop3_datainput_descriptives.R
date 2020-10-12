#############################
### R workshop 3 ###########
### 2020/09      ###########
############################

#Topics:
#data input
#install packages
#descriptives
#correlations

############################
#load a larger dataset that is in Rdata format
getwd()
setwd("/Users/ruqin/RTeaching")
load( "aflsmall.Rdata" )
#load( "./aflsmall.Rdata" )

#real data, relating to the Australian Football League (AFL)
#The afl.margins variable contains the winning margin (number of points) for all 176 home and away games played during the 2010 season. 
#The afl.finalists variable contains the names of all 400 teams that played in all 200 finals matches played during the period 1987 to 2010.

#view data
afl.finalists
afl.margins

#histogram
hist(afl.margins)
hist( x = afl.margins, 
      main = "2010 AFL margins", # title of the plot
      xlab = "Margin",           # set the x-axis label
      density = 40,              # draw shading lines: 40 lines per inch
      angle = 40,                # set the angle of the shading lines is 40 degrees
      border = "gray80",         # set the colour of the borders of the bars
      col = "lightblue",            # set the colour of the shading lines
      labels = TRUE,             # add frequency labels to each bar
      ylim = c(0,40)             # change the scale of the y-axis
)

#you can play around with many graphic options
hist( x = afl.margins, 
      main = "2010 AFL margins", # title of the plot
      xlab = "Margin",           # set the x-axis label
      #density = 20,              # draw shading lines: 10 per inch
      #angle = 40,                # set the angle of the shading lines is 40 degrees
      border = "gray20",         # set the colour of the borders of the bars
      col = "gray",            # set the colour of the shading lines
      labels = TRUE,             # add frequency labels to each bar
      ylim = c(0,40)             # change the scale of the y-axis
)

#overlay a distribution curve over histogram
m <- mean(afl.margins)
std <-sd(afl.margins)
hist(afl.margins, 
     breaks = 20,
     prob=TRUE,
     border = "gray20",         # set the colour of the borders of the bars
     col = "gray",            # set the colour of the shading lines
     # labels = TRUE,       
     main="normal curve over histogram")
curve(dnorm(x, mean=m, sd=std), 
      col="darkblue", lwd=2, add=TRUE,  yaxt="n")

#see "Rcolor.pdf" file on Canvas if you want to play with the color palette

#describe the dataset
summary(afl.margins)

#For mean of any vector
mean(afl.margins)
#try hand calculation
sum( afl.margins )
sum( afl.margins ) / length(afl.margins)

#Median
median(afl.margins)
#hand calculation
sort(afl.margins)
length(afl.margins) / 2

#Mode
sort(table(afl.margins)) #first row: observation value, second row: frequency
table( afl.finalists )
sort(table(afl.finalists))

#Variance 
var( afl.margins ) #default to sample
#hand calculation: Variance of sample
sum( (afl.margins-mean(afl.margins))^2 ) / (length(afl.margins)-1)

#Standard Deviation 
sd(afl.margins) #default function for sample
#hand calculation: sample
sqrt(sum( (afl.margins-mean(afl.margins))^2 ) / (length(afl.margins)-1))
#hand calculation: population
sqrt(sum( (afl.margins-mean(afl.margins))^2 ) / (length(afl.margins)))

#install a package to help us
install.packages('moments')
library( moments )
skewness(afl.margins)
kurtosis(afl.margins)


