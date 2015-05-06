plot3<-function(){
  #Source the getData.R file which loads the data from a ./data directory and makes all changes required to the data before 
  # it is needed by the plotting. Please review getData.R for the acquisition of data.
  source(file = "getData.R")
  mydata<-getData()
  png("plot3.png",width=480,height=480,units="px",bg="transparent")
  ylimRange <-c(0,10,20,30)
  ylimstd<-c(1,30)
  with(mydata,plot(DateTime,Sub_metering_1,type ="l", ylab = "Energy Sub Meetering"))
  with(mydata,lines(DateTime,Sub_metering_2, type = "l",col="red"))
  with(mydata,lines(DateTime,Sub_metering_3, type = "l",col="blue"))
  
  plot_colors<-c("black","red","blue")
  
  legend_text<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright",legend_text , cex=0.8, col=plot_colors,lty=1, lwd=2, bty="n");
  #Adding my name to the plot
  title(main="Al Pivonka")
  dev.off()
  
}
