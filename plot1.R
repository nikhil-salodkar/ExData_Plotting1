#read the data.
my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
my_data <- tbl_df(my_data)

#Get the data for the two required dates
my_data1 <- filter(my_data,Date == "1/2/2007" | Date == "2/2/2007")

#Observe that there is no NA values in Date and Time variables and all the variables 
#concerning the two dates in question. Therefore no need to handle NA Values.
#convert Date to POSIXct format using dmy function of lubridate and similarly convert time.
my_data1$Date <- dmy(my_data1$Date)
my_data1$Time <- hms(my_data1$Time)


png(filename = "plot1.png",width = 480,height = 480)
hist(my_data1$Global_active_power,col = "blue",main = "Global Active Power",xlab = "Global Active Power (kilowattts)")

dev.off()
