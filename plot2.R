# read data from file. 
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
# convert date string to date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
# read data for dates 2007/02/01 and 2007/02/02
mydata<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]        
#concatenate time to date and put it in POSIXct notation
mydata$Date<-as.POSIXct(paste(as.character(mydata$Date),as.character(mydata$Time)),"%d-%m-%Y %H:%M:%S")

#save image as png, default values are 480px width and height with white background
png("plot2.png")
##Draw Plot
#draw plot of type line with xlab and ylab set
plot(mydata$Global_active_power~mydata$Date,type="l",xlab="",ylab="Global Active Power(kilowatts)")
#close device
dev.off()
