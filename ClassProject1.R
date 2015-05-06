
#This is Al Pivonka's Orignial work. The plot#.R files are cleaned versions of the code base below.


library(R.cache)

genPlots<-function(){
  plot1()
  plot2()
  plot3()
  plot4()
}
 
getData<-function(){
  theKey=list("dataset")
  theData <-loadCache(theKey)
  if(!is.null(theData)){
    print("got data from cache")
    return(theData);
  }
  startDate<-as.Date('2007-2-1 00:00:00')
  endDate<-as.Date('2007-2-2 00:00:00')
  
  setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
  setClass('myDate')
  setAs("character","myTime", function(from) strptime(from, format="%H:%M:%S") )
  setClass('myTime')
  #theSql<-paste("select * from file WHERE Date BETWEEN ",startDate," and ",endDate,sep="")
  #print(theSql)
  #xx<-read.csv.sql(file = "data/household_power_consumption.txt", sql=theSql,sep=";",colClasses = c("myDate","myTime",rep('numeric',7)))
  
  xx<-read.csv(file = "data/household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",
      colClasses = c("myDate","character",rep('numeric',7)),check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
  
  yy<-xx[xx$Date>="2007-02-01" & xx$Date<="2007-02-02",]
  #print(class(xx$Date))
  #head(yy)
  #print(nrow(yy))
  theData<-yy
  saveCache(theData, key=theKey)
  theData
  
  
}

plot1<-function(){  
  data<-getData()
  
  png(filename = "plot1.png", 
      width = 480, height = 480, 
      units = "px", bg = "transparent")
  
  hist(x = data$Global_active_power, 
       xlab = "Global Active Power (kilowatts)",
       col = "red", 
       main = "Global Active Power (Al Pivonka)", 
       breaks = 12, ylim = c(0, 1200))
  
  dev.off()
}

plot2<-function(){
  mydata<-getData()
 # print(names(mydata[!complete.cases(mydata),]))
  datetime<-paste(mydata$Date,mydata$Time) 
  
  mydata$DateTime<-as.POSIXct(datetime)
  #print(mydata$DateTime)
  #print(mydata$Global_active_power)
  #class(mydata$DateTime)
  png("plot2.png",width=480,height=480,units="px",bg="transparent")
  #print(nrow(mydata))
 
  #plot(x = mydata$DateTime ,y = mydata$Global_active_power,type ="n", ylab = "Global Active Power (kilowatts)", xlab = "")
  #lines(mydata$DateTime,mydata$Global_active_power, type = "l")
  with(mydata,plot(DateTime,Global_active_power,type ="n", ylab = "Global Active Power (kilowatts)", xlab = ""))
  with(mydata,lines(DateTime,Global_active_power, type = "l"))
  title(main="Al Pivonka")
  dev.off()
  
}

plot3<-function(){
  mydata<-getData()
  # print(names(mydata[!complete.cases(mydata),]))
  datetime<-paste(mydata$Date,mydata$Time) 
  
  mydata$DateTime<-as.POSIXct(datetime)
  #print(mydata$DateTime)
  #print(mydata$Global_active_power)
  #class(mydata$DateTime)
  png("plot3.png",width=480,height=480,units="px",bg="transparent")
  #print(nrow(mydata))
  
  #plot(x = mydata$DateTime ,y = mydata$Global_active_power,type ="n", ylab = "Global Active Power (kilowatts)", xlab = "")
  #lines(mydata$DateTime,mydata$Global_active_power, type = "l")
  ylimRange <-c(0,10,20,30)
  ylimstd<-c(1,30)
  with(mydata,plot(DateTime,Sub_metering_1,type ="l", ylab = "Energy Sub Meetering"))
  
  with(mydata,lines(DateTime,Sub_metering_2, type = "l",col="red"))
  with(mydata,lines(DateTime,Sub_metering_3, type = "l",col="blue"))
  
  plot_colors<-c("black","red","blue")
 
  legend_text<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright",legend_text , cex=0.8, col=plot_colors,lty=1, lwd=2, bty="n");
  title(main="Al Pivonka")
 
  #print(mydata$Sub_metering_3)
  dev.off()
  print("done plot3")
  
}

plot4<-function(){
  mydata<-getData()
  datetime<-paste(mydata$Date,mydata$Time) 
  mydata$DateTime<-as.POSIXct(datetime)
  
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

