library(ggplot2)
library(treemapify)
data(Marriage,package = "mosaicData")
Marriage_count <- as.data.frame(table(Marriage$officialTitle))
names(Marriage_count) <- c("officialTitle","count")

ggplot(Marriage_count, aes(area = count, fill = officialTitle, label = officialTitle)) +
  geom_treemap()+
  geom_treemap_text(grow= TRUE,reflow = TRUE)

#Draw waffle charts
library(waffle)
ggplot(Marriage_count,aes(fill= officialTitle,values = count))+
  geom_waffle(na.rm = TRUE)

#bins are the ranges into which the data is grouped. The size of the bins is called bandwidth
data(Marriage,package="mosaicData")
ggplot(Marriage,aes(x=age))+
  geom_histogram(fill="cornflowerblue",color="black",bins=30)+
  labs(x="Age",title="Participants by age")

