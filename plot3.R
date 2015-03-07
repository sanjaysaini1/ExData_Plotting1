# read data from file. 
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
# convert date string to date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
# read data for dates 2007/02/01 and 2007/02/02
mydata<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]        
#concatenate time to date and put it in POSIXct notation
mydata$Date<-as.POSIXct(paste(as.character(mydata$Date),as.character(mydata$Time)),"%d-%m-%Y %H:%M:%S")

#save image as png, default values are 480px width and height with white background
png("plot3.png")
##Draw Plot
#create plot with mydata showing submetering_1 against date
with(mydata, plot(mydata$Sub_metering_1 ~ mydata$Date,type="l",xlab="",ylab="Energy sub metering"))
#add submetering_2 data against date in red
with(mydata, lines(mydata$Sub_metering_2 ~ mydata$Date,col="red"))
#add submetering_3 data against date in blue
with(mydata, lines(mydata$Sub_metering_3 ~ mydata$Date,col="blue"))
#set legend in top right corner with lines in black red and blue with appropriate names
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#closed device
dev.off()
