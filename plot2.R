## take data and output plot2

plot2 <- function(){
  
  #Read household_power_consumption.txt and simplify.
  inputdata <- read.csv("household_power_consumption.txt", sep = ";", as.is = TRUE)
  data <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Time, Global_active_power))
  data <- subset(data, Global_active_power != "?")
  data$timeAndDate <- paste(data$Time, data$Date, sep=" ")
  data$timeAndDate <- strptime(data$timeAndDate, "%H:%M:%S %e/%m/%Y")
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data <- subset(data, select = c(timeAndDate, Global_active_power))
  
  #create plot
  png(filename = "plot2.png", width = 480, height = 480)
  par(bg = "white", mar = c(2.1, 4.1, 2.1, 2.1))
  plot(data$timeAndDate, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}