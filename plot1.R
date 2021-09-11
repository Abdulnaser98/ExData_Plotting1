# read the data into a dataframe
df = read.table("household_power_consumption.txt", header = TRUE, sep = ';')

# convert the Date column into Date object. 
df$Date = as.Date(df$Date, format="%d/%m/%Y")

# convert the Time column into Time object. 
df$Time <- as.ITime(df$Time)

# convert the Global_active_power column into numerical column.
df$Global_active_power = as.numeric(df$Global_active_power)

# create a subset of the dataframe where the days are either (01-02-2007) or (02-02-2007)
observed_records = subset( df, Date== as.Date("2007-02-01") | Date== as.Date("2007-02-02"))

observed_records$Global_active_power = as.numeric(observed_records$Global_active_power)

png( file = "plot1.png", width = 480 , height = 480)

hist(observed_records$Global_active_power, xlab = "Global active power (kilowatts)" ,main="Global_active_power",
     col = c("red")
)

dev.off()

