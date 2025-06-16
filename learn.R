print("R script")
set.seed(0)
data <- rnorm(10^7)
print(head(data))

x <- 10
vec1 <- c(10,20,30)
print(vec1[1]) #Index starts from 1 in R
print(vec1[4]) #If the index is out of range, R will throw N
print(vec1)
vec2 <- c(50,60)
vec1 <- append(vec1,vec2)
print(vec1)

# R can deal with complex number
var1 <-complex(real = 7, imaginary = 10)
var2 <-complex(real = 7, imaginary = 10)
print(var1+var2)
char <- 'abc'
chartwo <- "abc"
char == chartwo
nchar(char) #Return the number of character
temp <- "hello world"
#Slice the string
substr(temp,start=7,stop=10)

temp2 <- "Today is Monday"
substr(temp2,start=1,stop=5)

#Vector only allows the same data type while list allows different datatypes
x <- list(1,2,3)
print(x)

list_container <- list(x=c(1,2,3),y="abc",z=c(TRUE,FALSE))
print(list_container)

print(list_container["x"])

vect <- numeric()
print(vect)

#The negative position of list in R is deleting the column so do not try to use it.
list2 <- list(a=c("abc","def"), b = c(4,3,2))
list3 <-append(list2,list_container)
print(list3)

#each column in the dataframe, have the same number of data while in list it is not necessary

df <- data.frame("car"=c("toyota","ford","nissan","suzuki"),speed=c(100,90,95,80),quality=c(5,4,3,2))
print(df)
rownames(df)
colnames(df)
is.data.frame(df)
is.list(df) # True as dataframe is a special condition of list
df1 <- data.frame()
df["price"] <- c(1000,1000,2000,3000) # the dataframe will add the column price at the end of the dataframe
print(df)

cbind(door=c(4,2,4,4),df) #add a column to the front
subset(df, quality>2) #get the subset for the dataframe with quality greater than 2

df
plot(df[["speed"]],df[["quality"]]) #Plot for speed vs quality

is_rain = FALSE
if(is_rain == TRUE){
  print("It is raining")
}else{
  print("Don't carry an umbrella")
}
marks <- 50
if( marks > 50){
  print("above avrerage")
} else{
  print("not pass")
}


if (marks > 50) {
  if (marks >= 81 && marks <= 100) {
    print("HD")
  } else if (marks > 60 && marks <= 80) {
    print("D")
  } else if (marks >= 51 && marks <= 60) {
    print("CE")
  } else {
    print("Grade undefined")
  }
} else {
  print("fail")
}

day_of_week <- 8
switch (day_of_week,
        "1" = "Monday",
        "Other days"
)
number <- c(1,2,3,4,5)
for(num in number){
  print(num^2)
}
number<- 45
i <- 1
while (2^i<=number){
  print(2^i)
  i <- i+1
}
# The break function in R is break()
number<- 45
i <- 1
repeat {
  if(2^i > number){
    break()
  }
  print(2^i)
  i <- i +1
}
# Function in R. Function is a block of code that can run when it is called
pri = function(n){
  print(n)
}
pri("Lam")

