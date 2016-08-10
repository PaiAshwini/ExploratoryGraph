#to demonstrate the ability to draw Plot2 graph
header <- read.table('Data/household_power_consumption.txt', nrows = 1, header = FALSE, sep =';')
#Reading only data of 2 days
reading <- read.table("Data/household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
names(reading)<-unlist(header)
reading$Global_active_power[reading$Global_active_power == "?"] <- NA
changed<-reading[!is.na(reading$Global_active_power),]
changed$Datetime<-strptime(paste(changed$Date,changed$Time),"%d/%m/%Y %H:%M:%S")
png(filename="plot2.png", width = 480, height = 480, bg="transparent")
#Drawing the plot
plot(changed$Datetime, changed$Global_active_power, type="l", main="",xlab="",ylab="Global Active Power (killowatts)")
#dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()
