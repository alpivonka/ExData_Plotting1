plot1<-function(){  
  #Source the getData.R file which loads the data from a ./data directory and makes all changes required to the data before 
  # it is needed by the plotting. Please review getData.R for the acquisition of data.
  source(file = "getData.R")
  #Call the get data.
  data<-getData()
  
  png(filename = "plot1.png", width = 480, height = 480,units = "px", bg = "transparent")
  # create a histgram. Please not my name is within the plot.
  hist(x = data$Global_active_power, xlab = "Global Active Power (kilowatts)",col = "red",  
      main = "Global Active Power (Al Pivonka)", 
       breaks = 12, ylim = c(0, 1200))
  
  dev.off()
}
