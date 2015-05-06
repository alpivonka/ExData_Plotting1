plot4<-function(){
  source(file = "getData.R")
  mydata<-getData()
  attach(mydata)
  
  png("plot4.png",width=480,height=480,units="px",bg="transparent")
  par(mfrow=c(2,2))
  
  #plot2
  plot(DateTime,Global_active_power,type ="l", ylab = "Global Active Power (kilowatts)", xlab = "",main="Al Pivonka")
  
  #plotx-Voltage
  plot(DateTime,Voltage,type ="l", ylab = "Voltage", xlab = "datetime",main="Al Pivonka")
  
  
  #plot3 
  ylimRange <-c(0,10,20,30)
  ylimstd<-c(1,30)
  plot(DateTime,Sub_metering_1,type ="l", ylab = "Energy Sub Meetering",main="Al Pivonka")
  lines(DateTime,Sub_metering_2, type = "l",col="red")
  lines(DateTime,Sub_metering_3, type = "l",col="blue")
  plot_colors<-c("black","red","blue")
  legend_text<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright",legend_text , cex=0.8, col=plot_colors,lty=1, lwd=2, bty="n");
  
  
  #plot-Global_reactive_power
  plot(DateTime,Global_reactive_power,type ="l", ylab = "Global_reactive_power", xlab = "datetime", main="Al Pivonka")
  
  dev.off()
}
