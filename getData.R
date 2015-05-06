getData<-function(){
  #Checking to make sure R.cache which is required is installed and available.
  if(!require(R.cache)){
    install.packages("R.cache")
    library(R.cache)
  }
  
  
  theKey=list("dataset")
  
  #Checking the Cache for avaible data
  theData <-loadCache(theKey)
  if(!is.null(theData)){
    print("got data from cache")
    return(theData);
  }
  
  
  
  setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
  setClass('myDate')
  #Load the data -- Yes, sql could have been used, yet I wanted to keep it simple and only load libraries when needed.
  xx<-read.csv(file = "data/household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",
               colClasses = c("myDate","character",rep('numeric',7)),check.names=FALSE, 
               stringsAsFactors=FALSE, comment.char="", quote='\"')
  
  #Narrow scope of theData to the two days we are interested in
  theData<-xx[xx$Date>="2007-02-01" & xx$Date<="2007-02-02",]
 
 #put the data/time together and add it to TheData as a new column DateTime
  datetime<-paste(theData$Date,theData$Time) 
  theData$DateTime<-as.POSIXct(datetime)
 
  #Save theData to the cache for future use 
  saveCache(theData, key=theKey)
  theData
  
  
}