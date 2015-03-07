# read data from file. 
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
# convert date string to date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
# read data for dates 2007/02/01 and 2007/02/02
mydata<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

#save image as png, default values are 480px width and height with white background
png("plot1.png")
##Draw section
#draw histogram with colour, title and xlab set
hist(mydata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#close device
dev.off()





