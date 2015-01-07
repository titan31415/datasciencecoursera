data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
classes <- sapply(data, class)
classes[1:2] <- "character"
# 66637
# 68078
# 69516
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                 "Voltage", "Global_intensity", "Sub_metering_1",
                                 "Sub_metering_2", "Sub_metering_3"),
                   na.strings = "?", colClass = classes, skip = 66636, nrows = 2880,
                   comment.char = "")
data$Date <- strptime(data$Date, "%d/%m/%Y")
library(chron)
data$Time <- times(data$Time)

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power, type = "s", xaxt = "n", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1439, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()
