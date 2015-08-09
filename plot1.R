## take data and output plot1


plot1 <- function(){
  
  #Read household_power_consumption.txt and simplify.
  inputdata <- read.csv("household_power_consumption.txt", sep = ";", as.is = TRUE)
  data <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Global_active_power))
  data <- subset(data, Global_active_power != "?")
  data$Global_active_power <- as.numeric(data$Global_active_power)
  
  #create histogram
  png(filename = "plot1.png", width = 480, height = 480)
  par(bg = "white")
  hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
  }
