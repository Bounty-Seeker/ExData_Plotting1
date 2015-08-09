## take data and output plot3

plot3 <- function(){
  
  #Read household_power_consumption.txt and simplify.
  inputdata <- read.csv("household_power_consumption.txt", sep = ";", as.is = TRUE)
  data <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
  data$timeAndDate <- paste(data$Time, data$Date, sep=" ")
  data$timeAndDate <- strptime(data$timeAndDate, "%H:%M:%S %e/%m/%Y")
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  data <- subset(data, select = c(timeAndDate, Sub_metering_1, Sub_metering_2, Sub_metering_3))
  
  #create plot
  png(filename = "plot3.png", width = 480, height = 480)
  par(bg = "white", mar = c(2.1, 4.1, 2.1, 2.1))
  plot(data$timeAndDate, data$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering")
  points(data$timeAndDate, data$Sub_metering_1, type = 'l')
  points(data$timeAndDate, data$Sub_metering_2, type = 'l', col = "red")
  points(data$timeAndDate, data$Sub_metering_3, type = 'l', col = "blue")
  legend("topright", lwd=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
  dev.off()
}