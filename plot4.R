# read data from file. 
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
# convert date string to date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
# read data for dates 2007/02/01 and 2007/02/02
mydata<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
#concatenate time to date and put it in POSIXct notation
mydata$Date<-as.POSIXct(paste(as.character(mydata$Date),as.character(mydata$Time)),"%d-%m-%Y %H:%M:%S")


#save image as png, default values are 480px width and height with white background
png("plot4.png")
##Draw plot
# set 2 row and 2 columns for 4 plots
par(mfrow=c(2,2))        
#create 1st plot
plot(mydata$Global_active_power~mydata$Date,type="l",xlab="",ylab="Global Active Power(kilowatts)")
#create 2nd plot
plot(mydata$Voltage~mydata$Date,type="l",xlab="datetime",ylab="Voltage")
#create 3rd plot
with(mydata, plot(mydata$Sub_metering_1 ~ mydata$Date,type="l",xlab="",ylab="Energy sub metering"))
with(mydata, lines(mydata$Sub_metering_2 ~ mydata$Date,col="red"))
with(mydata, lines(mydata$Sub_metering_3 ~ mydata$Date,col="blue"))
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
#create 4th plot
plot(mydata$Global_reactive_power~mydata$Date,type="l",xlab="datetime",ylab="Global_reactive_power")
#close device
dev.off()
