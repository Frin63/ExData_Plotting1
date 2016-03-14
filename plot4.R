# Plot4.r

#read file
powerData<-read.csv(file="household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

#select relevant dates
powerData<-subset(powerData,Date=="1/2/2007" | Date=="2/2/2007")

#add POSIXlt DateTime variable from Date and Time
powerData$DateTime<-strptime(paste(as.character(powerData$Date),as.character(powerData$Time),sep="-"),"%d/%m/%Y-%H:%M:%S")

#create the plot
pdf(file="plot4.pdf")
par(mfrow=C(2,2),mar=c(2,2,2,4))
with(powerData,plot(DateTime,Sub_metering_1,type="l",col="black",xlab="",ylab = "Energy sub metering", main = ""))
with(powerData,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(powerData,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()
