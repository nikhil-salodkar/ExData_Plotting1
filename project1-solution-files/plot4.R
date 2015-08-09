my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
my_data <- tbl_df(my_data)

my_data1 <- filter(my_data,Date == "1/2/2007" | Date == "2/2/2007")

my_data1$Date <- dmy(my_data1$Date)
my_data1 <- mutate(my_data1,date_time = paste(Date,Time))
my_data1$date_time = ymd_hms(my_data1$date_time)

png(filename = "plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))

#plot the first plot
with(my_data1,plot(date_time,Global_active_power,type = "l",col = "blue",ylab = "Global Active Power(kilowatts)",xlab = "Day"))

#plot the second plot
with(my_data1,plot(date_time,Voltage,xlab = "datetime",col = "blue",type = "l"))

#plot the third plot in the bottom left
with(my_data1,plot(date_time,Sub_metering_1,type = "l",xlab = "Day",ylab = "Energy sub metering"))
with(my_data1,points(date_time,Sub_metering_2,type = "l",col = "red"))
with(my_data1,points(date_time,Sub_metering_3,type = "l",col = "blue"))
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),cex = 0.8)

#plot the last plot
with(my_data1,plot(date_time,Global_reactive_power,xlab = "datetime",ylab = "Global reactive power",col = "red",type = "l"))

dev.off()
