## take data and output plot4

plot4 <- function(){
  
  #Read household_power_consumption.txt and simplify.
  inputdata <- read.csv("household_power_consumption.txt", sep = ";", as.is = TRUE)
  data <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Time, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3))
  data$timeAndDate <- paste(data$Time, data$Date, sep=" ")
  data$timeAndDate <- strptime(data$timeAndDate, "%H:%M:%S %e/%m/%Y")
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  data <- subset(data, select = c(timeAndDate, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3))
  
  #create plot
  png(filename = "plot4.png", width = 480, height = 480)
  par(bg = "white", mfrow = c(2,2), mar = c(4.1, 4.1, 1.5, 1.5) )
  plot(data$timeAndDate, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)", lwd = 0.25)
  
  plot(data$timeAndDate, data$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage", lwd =0.25)
  
  plot(data$timeAndDate, data$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
  points(data$timeAndDate, data$Sub_metering_1, type = 'l')
  points(data$timeAndDate, data$Sub_metering_2, type = 'l', col = "red")
  points(data$timeAndDate, data$Sub_metering_3, type = 'l', col = "blue")
  legend("topright", lwd=c(1,1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
  
  plot(data$timeAndDate, data$Global_reactive_power, type = 'l', xlab = "", ylab = "Global_reactive_power", lwd = 0.25)
  
  dev.off()
}