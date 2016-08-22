# reading table, taking cells within desired data range
fullData <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Changing date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Creating Datetime field
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Creating and saving the plot
png("plot3.png", height = 480, width = 480)
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red") 
  lines(Sub_metering_3~Datetime, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.9)

# Saves plot
dev.off()
