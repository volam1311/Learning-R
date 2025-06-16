library(ggplot2)
data(Marriage,package="mosaicData")
ggplot(Marriage,aes(x=age))+
  geom_density(fill="cornflowerblue",bw=10)+
  labs(title="Participants by Age")
