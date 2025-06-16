library(ggplot2)
install.packages("mosaicData")
data(Marriage,package="mosaicData")

df <- Marriage
ggplot(Marriage,aes(x=race)) + geom_bar(fill = "cornflowerblue", color="black") + labs(x="Race",y="Count",title ="Participants")

ggplot(Marriage,aes(x=race, y=after_stat(count/sum(count)))) + geom_bar(fill = "cornflowerblue", color="black") + labs(x="Race",y="Percent",title ="Participants")+scale_y_continuous(labels=scales::percent)

ggplot(Marriage,aes(x=officialTitle)) +
  geom_bar()+coord_flip() #flip the vertical and horizontal so that the plot looks better
  labs(x="Official Title",y ="Participants count",title="Count participants by title")

ggplot(Marriage,aes(x=officialTitle)) +
  geom_bar()+
  labs(x="Official Title",y ="Participants count",title="Count participants by title")+
  theme(axis.text.x=element_text(angle=45,hjust=1))

# Use the ggpie library to draw pie charts
install.packages("ggpie")
library(ggpie)
data(Marriage,package="mosaicData")

ggpie(Marriage,count_type="full",fill_color=NULL,group_key="race")
