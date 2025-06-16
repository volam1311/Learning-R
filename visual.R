library(readr)
salary<-read_csv("Salaries.csv")
library(dplyr)

starwarsdata <- starwars #The starwars data is basically on the dplyr library
newdata <- select(starwarsdata,name,height,mass) #get the specific rows and columns from the data
newdata2 <- mutate(newdata,height=height*2, mass=mass*2) #Change the values in the columns
newdata3 <- filter(newdata, height>172) #filter the data by some conditions
newdata4 <- summarize(newdata,meanheight=mean(height,na.rm=TRUE),meanmass=mean(mass,na.rm=TRUE)) #Summarize the dat by its mean and remove the NaN values inside the data
newdata5 <- arrange(newdata,desc(height)) #Sort the values
# You can view the data by enter View("name_of_the_variables")

library(ggplot2)
library(dplyr)
insurance <- read.csv("insurance.csv")
insurance$obese <- if_else(insurance$bmi>30,"obese","notobese")
#If there is no obese column we will create a new one. Then we will put the data inside it by the conditions if bmi >30 then obese else notobese
ggplot(insurance,mapping = aes(age,charges,color=smoker))+geom_point(alpha=0.7,size=2)+ #geom gives us the option to draw it by point,...
geom_smooth(method = "glm") #Draw a smoothing line throughout the data
# We also split the data into smoker with different colors

ggplot(insurance,mapping = aes(age,charges,color=smoker))+geom_point(alpha=0.7,size=2)+ geom_smooth(method = "glm") +
facet_wrap(~obese) # We also can use this to split the table into 2 different cases with notobese and obese

ggplot(insurance,mapping = aes(age,charges,color=smoker))+geom_point(alpha=0.7,size=2)+ geom_smooth(method = "glm") +
  facet_wrap(~obese)+labs(title="Insurance Plot",subtitle = "plot for the graph from age 20 to 60",x="age", y="expenses",color="smoker")+
#We add the titles and subtitles and labels for the x and y of the graph
theme_bw()

