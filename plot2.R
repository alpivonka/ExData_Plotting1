plot2<-function(){
  #Source the getData.R file which loads the data from a ./data directory and makes all changes required to the data before 
  # it is needed by the plotting. Please review getData.R for the acquisition of data.
  source(file = "getData.R")
  mydata<-getData()
 
  png("plot2.png",width=480,height=480,units="px",bg="transparent")
  with(mydata,plot(DateTime,Global_active_power,type ="n", ylab = "Global Active Power (kilowatts)", xlab = ""))
  with(mydata,lines(DateTime,Global_active_power, type = "l"))
  #I have added my name to the plot.
  title(main="Al Pivonka")
  dev.off()
  
}
