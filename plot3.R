"
Does the plot appear to address the question being asked?
Is the submitted R code appropriate for construction of the submitted plot?

Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these 
four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions 
from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question."

library(ggplot2)
options(scipen=999)
NEI <- readRDS("./exdata data NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata data NEI_data/Source_Classification_Code.rds")

sub_emissions<- subset(NEI,fips="24510")
g<-ggplot(sub_emissions,aes(year,Emissions,color=type))

dev.copy(png, file = "plot3.png")
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions for Baltimore City ",x="Year (1999 - 2008)")
dev.off()