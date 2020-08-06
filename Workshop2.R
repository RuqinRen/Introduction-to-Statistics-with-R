#############################
### R workshop 2 ###########
### 2020/09      ###########
############################

#Topics:
#load datasets
#random number generation
#log transformation
#make graphs

##############################
#### load your data #########
##############################

#download the dataset to your computer
#acs <- read.csv(url("http://stat511.cwick.co.nz/homeworks/acs_or.csv"))
getwd()
setwd("/Users/ruqin/RTeaching")
acs <- read.csv("acs_or.csv", header = TRUE)

#View
View(acs)
acs$age_husband
acs[1,3]
names(acs)
colnames(acs)
a <- subset(acs , age_husband > age_wife)
?subset

#describe the dataset
summary(acs)
#For mean of any column
mean(acs$age_husband)
#Median
median(acs$age_husband)
# Quantile 
quantile(acs$age_wife)
#Variance 
var(acs$age_wife)
#Standard Deviation 
sd(acs$age_wife)


#extrat random rows
b <- acs[sample(nrow(acs), 3), ]
b <- acs[sample(nrow(acs), 10), ]
sample(100,5)
b <- acs[1:5,]
b

##############################
#### graphs     #######
##############################

Fibonacci <- c( 1,1,2,3,5,8,13 )
plot( Fibonacci )

plot( x = Fibonacci,
      main = "You specify title using the 'main' argument",
      sub = "The subtitle appears here! (Use the 'sub' argument for this)",
      xlab = "The x-axis label is 'xlab'",
      ylab = "The y-axis label is 'ylab'" 
)

plot( x = Fibonacci,                           # the data to plot
      main = "The first 7 Fibonacci numbers",  # the title
      xlab = "Position in the sequence",       # x-axis label
      ylab = "The Fibonacci number",           # y-axis 
      font.main = 1,
      cex.main = 1,
      font.axis = 2,
      col.lab = "gray50" )


#built in plot
plot(x = acs$age_husband , y = acs$age_wife, type = 'p')
plot(x = a$age_husband , y = a$age_wife, type = 'p')
plot(x = a$age_husband , y = a$age_wife, type = 'l')
?plot

# type = "p". Draw the points only.
# type = "l". Draw a line through the points.
# type = "o". Draw the line over the top of the points.
# type = "b". Draw both points and lines, but don’t overplot.
# type = "h". Draw “histogram-like” vertical bars.
# type = "s". Draw a staircase, going horizontally then vertically.
# type = "S". Draw a Staircase, going vertically then horizontally.
# type = "c". Draw only the connecting lines from the “b” version.
# type = "n". Draw nothing. (Apparently this is useful sometimes?)

plot( x = Fibonacci,
      type = "b",
      col = "blue",
      pch = 18,
      cex=5,
      lty=2,
      lwd=4)

#histogram
hist(acs$number_children, main='Default breaks')
hist(acs$number_children, breaks = 0:20, main='Breaks = 20')
hist(acs$number_children, breaks=c(0,2,4,6,8,10,12,14), main="Breaks is a vector")
hist(acs$number_children, breaks=seq(0,13,by=1), labels=TRUE,main="Breaks is a sequence function")

counts <- table(acs$bedrooms)
barplot(counts, main="Bedrooms Distribution",  xlab="Number of Bedrooms")
barplot(counts,
        main="Bedrooms Distribution", 
        xlab="Number of Bedrooms",
        las=2,
        density = 10,
        angle = 20)


plot(x = acs$number_children,
     y = acs$bedrooms)

plot(x = acs$age_husband,
     y = acs$age_wife)

plot(
x = acs$age_husband,
y = acs$age_wife,
xlab = "Husband age",        # x-axis label
ylab = "Wife age",   # y-axis label
xlim = c(10,100),                   # scale the x-axis
ylim = c(10,100),                  # scale the y-axis
pch = 20,                         # change the plot type
col = "gray50",                   # dim the dots slightly
frame.plot = FALSE                # don't draw a box
)
