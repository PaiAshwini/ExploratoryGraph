#to demonstrate the ability to draw Plot2 graph

header <- read.table('Data/household_power_consumption.txt', nrows = 1, header = FALSE, sep =';')
#Reading only data of 2 days
reading <- read.table("Data/household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
names(reading)<-unlist(header)
reading$Global_active_power[reading$Global_active_power == "?"] <- NA
changed<-reading[!is.na(reading$Global_active_power),]
changed$Datetime<-strptime(paste(changed$Date,changed$Time),"%d/%m/%Y %H:%M:%S")
png(filename="plot3.png", width = 480, height = 480, bg="transparent")
plot(changed$Datetime, changed$Sub_metering_1, type="n", main="",xlab="",ylab="Energy sub metering")
#Drawing the points for each readings
points(changed$Datetime, changed$Sub_metering_1, col = "#ABABAB", type="l")
points(changed$Datetime, changed$Sub_metering_2, col = "#FB0007", type="l")
points(changed$Datetime, changed$Sub_metering_3, col = "blue", type="l")
#Adding the legends with colors
legend("topright",col=c("#ABABAB","#FB0007","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1),yjust=2)
dev.off()