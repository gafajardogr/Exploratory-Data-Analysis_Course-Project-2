"
Does the plot appear to address the question being asked?
Is the submitted R code appropriate for construction of the submitted plot?

Across the United States, how have emissions from coal combustion-related 
sources changed from 1999–2008?"


NEI <- readRDS("./exdata data NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata data NEI_data/Source_Classification_Code.rds")

options(scipen=999)
NEI_coal<- NEI[which(NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
g<-ggplot(NEI_coal,aes(year,Emissions))

dev.copy(png, file = "plot1.png")
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions from coal combustion-related sources",x="Year (1999 - 2008)")
dev.off()
