# Plot2.r

#read file
powerData<-read.csv(file="household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

#select relevant dates
powerData<-subset(powerData,Date=="1/2/2007" | Date=="2/2/2007")

#add POSIXlt DateTime variable from Date and Time
powerData$DateTime<-strptime(paste(as.character(powerData$Date),as.character(powerData$Time),sep="-"),"%d/%m/%Y-%H:%M:%S")

#create the plot
png(file="plot2.png",width=480,height=480)
with(powerData,plot(DateTime,Global_active_power,type="l",col="black",xlab="",ylab = "Global Active Power (kilowatts)"))
dev.off()
