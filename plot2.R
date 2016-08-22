# reading table, taking cells within desired data range
fullData <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Changing date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Creating Datetime field
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## making the plot
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Saves plot
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
