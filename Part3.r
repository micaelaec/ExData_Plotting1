setwd("./Documents/Coursera/Exploratory Data Analysis")
dataset <- read.table("household_power_consumption.txt",nrows=100,sep=";",header=TRUE)
classes <- sapply(dataset, class)
dataset <- read.table("household_power_consumption.txt",colClasses=classes,sep=";",header=TRUE,na.strings="?")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")

dataset <- dataset[dataset$Date=="2007-02-01"|dataset$Date=="2007-02-02",]

dataset$date_time <- paste(dataset$Date,dataset$Time)
dataset$date_time <- strptime(dataset$date_time,format="%Y-%m-%d %H:%M:%S")

png(filename="./plot3.png",width=480,height=480)

with(dataset,plot(x=date_time,y=Sub_metering_1,type="n"
                  ,ylab="Energy Sub Metering",xlab=""))
lines(x=dataset$date_time,y=dataset$Sub_metering_1,type="s",col="black")
lines(x=dataset$date_time,y=dataset$Sub_metering_2,type="s",col="red")
lines(x=dataset$date_time,y=dataset$Sub_metering_3,type="s",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=1,col=c("black","red","blue"))
dev.off()