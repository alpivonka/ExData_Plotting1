plot1<-function(){  
  source(file = "getData.R")
  data<-getData()
  
  png(filename = "plot1.png", width = 480, height = 480,units = "px", bg = "transparent")
  
  hist(x = data$Global_active_power, xlab = "Global Active Power (kilowatts)",col = "red",  main = "Global Active Power (Al Pivonka)", 
       breaks = 12, ylim = c(0, 1200))
  
  dev.off()
}