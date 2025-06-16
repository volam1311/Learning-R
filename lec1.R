x <- 2
x <- 3
y <- x + 10
z <-  x-1
i <- exp(x) #calculate the exponential of x or e^x
rm(x)
#Fn + F1 to open help, select a variable and press Command + Return we can see the full variable if it is a vector.
x <- 3
x < y
x > y
x != y
x == y

class(i) #datatype
is.integer(x)
as.integer(x)
as.integer(i)
c <- "lobster"
x <- c("lobster") 
class(x)
#Vectors:
v1 <- c(1,2)
v1 <- c(11,22,33)
v2 <- c("Monday","Tuesday","Friday")
v3 <- rep(22,2) #repeats the number 22 2 times.
v4 <- 1:100 #from 1 to 100
v4[20] #show the value of v4 at the position 20
v5 <- seq(from=1, to=100,by=2) #from 1 to 100, step = 2
v5[c(10,12)] #show the value at postion 10 and 12, remember R starts from index 1
v6 <- v2[-3] #eleminate elements at pos -3 
v7 <- sample(10:50,10) #create 10 int values between 10 and 50
v8 <- rnorm(50,100,100) #create random data that matches the normal distribution 
v9 <- rnorm(100,50,100)
hist(v9) #draw the histogram of v9
#summary
length(v4)
summary(v4)
sum(v1)
min(v2)
max(v5)
mean(v9)
mat1 <- matrix(v5,nrow = 10, ncol = 5)
v2 <- c("Mon","Tue","Wed","Thur","Fri")
colnames(mat1) <- v2 #change the column name, enter View(mat1) can help show the matrix in new page.
mat1[4,3]
mat1[4,]
xx <- mat1[,3]
q <- mat1[,c(1,3)]

cars <- mtcars
length(cars)
nrow(cars)
ncol(cars)
colnames(cars)
cars[,4]
cars$hp #console a column by its name
all <- list(v1,v2,v3,v4,cars,mat1)
all[6]

#### 6. Exercises ####

# Write a R program to create a sequence of numbers from 20 to 50
v10 <- 20:50
# find the mean of the numbers going from 20 to 60
mean(20:50)
# sum of numbers from 51 to 91
sum(51:91)
# repeat "I got this" 19 times
rep("I got this",19)
# create a matrix of 3 columns and 5 rows filled with numbers from 300 to 335
mat2 <- matrix(300:335, ncol = 3, nrow = 5)
#Write a R program to create three vectors a,b,c with 3 integers. 
#Combine the three vectors to become a 3×3 matrix where each column 
#represents a vector. Print the content of the matrix.
a <- 1:3
b <- 4:6
c <- 7:9
d <- c(a,b,c)
mat3 <- matrix(d,nrow=3,ncol = 3)
#More exercises with solutions: https://www.w3resource.com/r-programming-exercises/basic/index.php



#### USING R ####
#### 1. Import data ####

# set directory to shorten your routes
getwd() # which working directory is selected
setwd("/Users/mymac/Documents") # change it to a new one

# data format
NP <- read.csv("~/Desktop/Grassland_data.csv") # change the route between " " according to your files

# Packages are R code containing functions you can use. To install:
# install.packages("openxlsx")
# or go to tools > Install Packages > type the name of the desired package
library(openxlsx) # It charges the package "openxlsx"

T1 <- read.xlsx("~/Desktop/Art. Defoliacio/Manuscrit/v6/Table 1.xlsx") #function from openxlsx package to charge xlsx files

load("~/Desktop/Guaiana Papers/Treball/Above.R") # When the data is in R format

#### 2. Play with data ####
#find and replace tool
#subset
library(plyr)
load("~/Desktop/Guaiana Papers/Treball/Above.R")
summary(Above) #R has its data frames charges in the base by default. Cars is one of them

skimr::skim(Above) # call package just now without charging it into the session with library()

head(Above)
colnames(Above)
unique(Above$topography)
Above[,1]
Above$site
hist(Above$C)
lowC <- subset(Above, Above$C < 50)
hist(lowC$C)

# create a new column with $
data() #all the databases available in R
npk <- npk

npk$all_fert <- paste(npk$N, npk$P, npk$K, sep = "_")

# Exercise: Subset the data by N, just take the N fertilized.
fertN <- subset(npk, npk$N == 1)

# paste df o vectors
rbind()
cbind()

all_fert <- paste(npk$N, npk$P, npk$K, sep = "_")
new <- cbind(npk, all_fert)

#### 3. Create basic models and statistics ####
npk <- npk

# linear model
m1 <- lm(yield ~ N+P+K, data = npk) #apply log(N)
m1
hist(resid(m1), nclass=6)
summary(m1)
boxplot(yield~N, data=npk)

sum <- summary(m1)

sum$coefficients

# glm
m1 <- glm(yield ~ N+P+K, data = npk, family=Gamma(link = "inverse")) #apply log(N)

# Exercise: are there any differences in yield due to its block?
m2 <- lm(yield ~ block, data= npk)
summary(m2)

# linear mixed models
library(nlme)
library(lmerTest)
mm1 <- lme(yield ~ N+P+K, random=~1|block, data=npk, na.action = na.omit) #add na.omit
hist(resid(mm1), nclass=8)
summary(mm1)
a <- summary(mm1)

a$varFix
save(mm1, "~/Desktop/mm1.R")
write.csv(mm1, "")

#### FEELING LIKE A HACKER ####
#### 1. Loops ####

# for
year <- c(2010,2011,2012,2013,2014,2015)
year <- 2010:2015

for (i in year){
  print(paste("The year is", i))
}

# while
i <- 1

while (i < 6) {
  print(i)
  i = i+1
}

# if else
x <- -1

if(x > 0){
  print("Positive number")
} else {
  print("Negative number")
}

#### 2. Functions ####
celsius_to_kelvin <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}

e <- seq(1:30)

kelvin <- celsius_to_kelvin(temp_C=e)

#### 3. Good manners and tricks ####

# format according to the subprocess
# same policy with spaces
# search tool
# cmd + shift + c <- convert all selected text to annotation and viceversa
# click on a key. It will highlight in bold the closing one
# you hide whole section just clicking on the arrow next to its title
# gc() for cleaning memory

#### 4. Practical example 1 ####
library(nlme)
npk <- npk

elem=colnames(npk[2:4])
data=npk
i=1
mixed_m <- function(elem,data){
  out <- data.frame()
  for(i in 1:length(elem)){
    form <- paste("lme(yield ~",elem[i], ", random=~1|block, data=data, na.action=na.omit)") # create model expression
    m1 <- eval(parse(text=form)) # run model expression
    sum <- summary(m1) # save model summary
    sum_mods <- data.frame(sum$tTable, sum$AIC, elem[i]) # select and format into a dataframe the interesting features from summary
    out <- rbind(out, sum_mods) # add the results in the object "out" previously created
  }
  colnames(out)[6:7] <- c("AIC","element") # modify some column names
  return(out) # define the output
}

treatment <- mixed_m(elem=colnames(npk[2:4]), data=npk)
rownames(treatment) <- c("Control N", "N fert", "Control P", "P fert", "Control K", "K fert")

options(scipen=999)
write.csv(treatment, file="~/Desktop/Guaiana Papers/Treball/treatment_mixed_topographyfix.csv")

