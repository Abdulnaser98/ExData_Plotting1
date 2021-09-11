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

observed_records = subset( df, Date== as.Date("2007-02-01") | Date== as.Date("2007-02-02"))

observed_records$Global_active_power <- as.numeric(observed_records$Global_active_power)

png( file = "plot2.png", width = 480 , height = 480)

plot(observed_records$date_time, observed_records$Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)",xlab="" )

dev.off()
