#to demonstrate the ability to draw Plot2 graph
header <- read.table('Data/household_power_consumption.txt', nrows = 1, header = FALSE, sep =';')
#Reading only data of 2 days
reading <- read.table("Data/household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
names(reading)<-unlist(header)
reading$Global_active_power[reading$Global_active_power == "?"] <- NA
changed<-reading[!is.na(reading$Global_active_power),]
changed$Datetime<-strptime(paste(changed$Date,changed$Time),"%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width = 480, height = 480, bg="transparent")
#Specifying the no. of plots to be drawn
par(mfrow=c(2,2), mar=c(6,6,1,1))
#First Plot
plot(changed$Datetime, changed$Global_active_power, type="l", main="",xlab="",ylab="Global Active Power (killowatts)")
#Second Plot
plot(changed$Datetime, changed$Voltage, type="l", main="",xlab="",ylab="Voltage")
#Third Plot
plot(changed$Datetime, changed$Sub_metering_1, type="n", main="",xlab="",ylab="Energy sub metering")
#Drawing the points for each readings
points(changed$Datetime, changed$Sub_metering_1, col = "#ABABAB", type="l")
points(changed$Datetime, changed$Sub_metering_2, col = "#FB0007", type="l")
points(changed$Datetime, changed$Sub_metering_3, col = "blue", type="l")
#Adding the legends with colors
legend("topright",col=c("#ABABAB","#FB0007","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lwd=c(1,1),yjust=2)
#Fourth Plot
plot(changed$Datetime, changed$Global_reactive_power, type="l", main="",xlab="",ylab="Global_reactive_power")
#Saving to file
#dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()