"
Does the plot appear to address the question being asked?
Is the submitted R code appropriate for construction of the submitted plot?

Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
(fips == "24510") from 1999 to 2008? 
Use the base plotting system to make a plot answering this question."

setwd("C:/Coursera/4. Exploratory Data Analysis/Course Project 2")
NEI <- readRDS("./exdata data NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata data NEI_data/Source_Classification_Code.rds")

options(scipen=999)
Emission=matrix(nrow=4,ncol=2)
Emission[,1]=levels(as.factor(NEI$year))
for (i in seq_along(levels(as.factor(NEI$year)))){
  Emission[i,2]=sum(NEI[which(NEI$year==levels(as.factor(NEI$year))[i] & NEI$fips=="24510"),4])
}
Emission<- data.frame(Emission,stringsAsFactors = F)
names(Emission)<- c("year","emission")
Emission$emission<- as.numeric(Emission$emission)

dev.copy(png, file = "plot2.png")
with(Emission,plot(year,emission,type="o"))
dev.off()