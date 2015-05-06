plot2<-function(){
  source(file = "getData.R")
  mydata<-getData()
 
  png("plot2.png",width=480,height=480,units="px",bg="transparent")
  with(mydata,plot(DateTime,Global_active_power,type ="n", ylab = "Global Active Power (kilowatts)", xlab = ""))
  with(mydata,lines(DateTime,Global_active_power, type = "l"))
  title(main="Al Pivonka")
  dev.off()
  
}