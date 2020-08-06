#############################
### R workshop 1 ###########
### 2020/09      ###########
############################

#every programmer starts with "hello world"
print('hello world!')
print(1)

#run your first calculation
10+20

#run commands in sequence or individually
1+2
1+3
print(1+2)

# formmating is important in programming!
1 ＋ 2

# equal sign vs. equality operator
10 = 20
10 == 20
10 == 10
2 + 2 == 4
2 + 2 == 5

# logical operators:
# less than	<	
# less than or equal to	<=	
# greater than	>	
# greater than or equal to	>=	
# equal to	==	
# not equal to	!=	

#more logical operators:
# not	!	
# or	|	
# and	&	
#try them yourself:
!TRUE
!True
TRUE | FALSE
TRUE & FALSE
(1==1) & (2==3)

#spacing does not matter, indentation does not matter
10    + 20
       1+2
       
#but you must finish a sentence, all the time
       10 +
         + -
         
#more calculations
5 * 5	
5/5
10/3
5^2
5^3
sqrt(25)
225 ^ 0.5
sqrt( 1 + abs(-8) )

#parentheses
2 * (5 + 1)
2 *  5 + 1

#same priority? left to right
4 / 2 * 3

#creating objects
sales <- 350
sales

royalty <- 7
sales * royalty
revenue <- sales * royalty
revenue

revenue <- revenue + 550
revenue

#funcitons and arguments
round( 3.1415 )
round( 3.14165, 2 )
round( 2, 3.14165 )
round( x = 3.1415, digits = 2 )
round( digits = 2, x = 3.1415 )

?round
#Help is how you learn everything in R!

#create some data
sales.by.month <- c(0, 100, 200, 50, 0, 0, 0, 0, 0, 0, 0, 0)
sales.by.month
class(sales.by.month)

sales.by.month[2]
sales.by.month[0]
sales.by.month[1]

sales.by.month[5] <- 25
sales.by.month

sales.by.month[1] <- 'no sales'
sales.by.month

length( x = sales.by.month )
length(sales.by.month )

#vectors are computable too

sales.by.month * 7
sales.by.month[1] <- 0
as.numeric(sales.by.month) *7
sales.by.month <- as.numeric(sales.by.month)

#text as data
months <- c("January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", 
            "December")
class(months)
class(sales.by.month)
months[4]

#Indexing
sales.by.month[ c(2,3,4) ]
months[c(2,3,4)]
2:8
sales.by.month[2:8]

#logical indexing
months[ sales.by.month > 0 ]
#what is happening here?
sales.by.month > 0
a <-  sales.by.month > 0 
a
months[a]

#R workspace vs R files
getwd()
setwd("/Users/ruqin/RTeaching")
q()
