"
Does the plot appear to address the question being asked?
Is the submitted R code appropriate for construction of the submitted plot?

How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?"


NEI <- readRDS("./exdata data NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata data NEI_data/Source_Classification_Code.rds")

options(scipen=999) 
NEI_motorvehicle<- NEI[which(NEI$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] & NEI$fips=="24510"),]

g<-ggplot(NEI_motorvehicle,aes(year,Emissions))

dev.copy(png, file = "plot4.png")
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from motor vehicle for Baltimore City",x="Year (1999 - 2008)")
dev.off()