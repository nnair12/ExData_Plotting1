# reading table, taking cells within desired data range
fullData <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- fullData[fullData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Creates Date/Time field
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Creates histogram
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Saves histogram
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
