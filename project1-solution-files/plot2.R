my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
my_data <- tbl_df(my_data)

my_data1 <- filter(my_data,Date == "1/2/2007" | Date == "2/2/2007")

#mutate generates a new variable date_time which contains information regarding date and time combined.
my_data1$Date <- dmy(my_data1$Date)
my_data1 <- mutate(my_data1,date_time = paste(Date,Time))
my_data1$date_time = ymd_hms(my_data1$date_time)

png(filename = "plot2.png",width = 480,height = 480)
with(my_data1,plot(date_time,Global_active_power,type = "l",col = "blue",ylab = "Global Active Power(kilowatts)",xlab = "Day"))
dev.off()