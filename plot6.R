"
Does the plot appear to address the question being asked?
Is the submitted R code appropriate for construction of the submitted plot?

Compare emissions from motor vehicle sources in Baltimore City with emissions 
from motor vehicle sources in Los Angeles County, California (fips == 06037). 
Which city has seen greater changes over time in motor vehicle emissions?"


NEI <- readRDS("./exdata data NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata data NEI_data/Source_Classification_Code.rds")
options(scipen=999)

NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
tco <- c("24510","06037")
NEI_motorvehicle_both<-subset(NEI_motorvehicle,fips %in% tco)
g<-ggplot(NEI_motorvehicle_both,aes(year,Emissions,color=fips))


dev.copy(png, file = "plot6.png")
g+geom_line(stat = "summary",fun.y="sum") + labs(y="Emissions from motor vehicle for Los Angeles and Baltimore City",x="Year (1999 - 2008)")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))
dev.off()