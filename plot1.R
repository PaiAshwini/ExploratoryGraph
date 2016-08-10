#to demonstrate the ability to draw Plot1 graph
library("dplyr")

header <- read.table('./Data/household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
reading <- read.table("./Data/household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
names(reading)<-unlist(header)
png(filename="plot1.png", width = 480, height = 480, bg="transparent")
hist(reading$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)",col="#FB0007", breaks = 11)
dev.off()
