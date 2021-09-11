library(data.table)

# read the data into a dataframe  
df = read.table("household_power_consumption.txt", header = TRUE, sep = ';')

# convert the Date column into Date object.   
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

# convert the Time column into Time object. 
df$Time <- as.ITime(df$Time)

# create the date_time column combined of the Date and Time columns.
df$date_time <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

# convert the Global_active_power column into numerical column.  
df$Global_active_power <- as.numeric(df$Global_active_power)

# create a subset of the dataframe where the days are either (01-02-2007) or (02-02-2007)
observed_records = subset( df, Date== as.Date("2007-02-01") | Date== as.Date("2007-02-02"))


#save the plotting inside png file. 
png( file = "plot4.png" , width = 480 , height = 480)

#two rows and two columns 
par(mfrow = c(2,2))

# the first plot on the top-left side
plot(observed_records$date_time, observed_records$Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)",xlab="" )

# the second plot on the top-right side
plot(observed_records$date_time, observed_records$Voltage, type="l", ylab = "Voltage",xlab="datetime" )

# the third plot on the down-left side
plot(observed_records$date_time, observed_records$Sub_metering_1 ,type="n",xlab = "" ,ylab="Energy sub metering")

points(observed_records$date_time, observed_records$Sub_metering_1, type="l" )
points(observed_records$date_time, observed_records$Sub_metering_2,type="l", col="red" )
points(observed_records$date_time, observed_records$Sub_metering_3,type="l", col="blue"  )
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty = 1, col = c("black", "red","blue") )


# the fourth plot on the down-left side
plot(observed_records$date_time, observed_records$Global_reactive_power, type="l", ylab = "Global reactive Power ",xlab="datetime" )

#clode the png driver.
dev.off()
