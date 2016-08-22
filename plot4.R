# reading table, taking cells within desired data range
fullData <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Changing date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Creating Datetime field
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Creating and saving plot
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

# Saves plots
dev.off()
