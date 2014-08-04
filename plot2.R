library(ggplot2)

data <- read.csv("./power data.csv", stringsAsFactors = FALSE)

#Convert Date variables to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Convert Time variables to Time class
data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Drop time column from data
drops <- "Time"
data <- data[, !(names(data) %in% drops)]

#plot and save graph
png(filename = "./plot2.png", width = 480, height = 480)

plot(data$Date, data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)", col = "black")

dev.off()




