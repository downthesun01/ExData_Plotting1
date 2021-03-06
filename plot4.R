library(ggplot2)

data <- read.csv("./power data.csv", stringsAsFactors = FALSE)

#Convert Date variables to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Convert Time variables to Time class
data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Drop time column from data
drops <- "Time"
data <- data[, !(names(data) %in% drops)]

#plot the graph
png(filename = "./plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(data$Date, data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power", col = "black")
plot(data$Date, data$Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage", col = "black")
{
    plot(data$Date, data$Sub_metering_1, type = "n", main = "", xlab = "", ylab = "Energy sub metering", col = "black")
    points(data$Date, data$Sub_metering_1, type = "l", col = "black")
    points(data$Date, data$Sub_metering_2, type = "l", col = "red")
    points(data$Date, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
}
plot(data$Date, data$Global_reactive_power, type = "l", main = "", xlab = "datetime", ylab = "Global_reactive_power", col = "black")

dev.off()
