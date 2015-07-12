setwd("./Documents/Coursera/Exploratory Data Analysis")
dataset <- read.table("household_power_consumption.txt",nrows=100,sep=";",header=TRUE)
classes <- sapply(dataset, class)
dataset <- read.table("household_power_consumption.txt",colClasses=classes,sep=";",header=TRUE,na.strings="?")
dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")

dataset <- dataset[dataset$Date=="2007-02-01"|dataset$Date=="2007-02-02",]

dataset$date_time <- paste(dataset$Date,dataset$Time)
dataset$date_time <- strptime(dataset$date_time,format="%Y-%m-%d %H:%M:%S")

png(filename="./plot1.png",width=480,height=480)
hist(dataset$Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)")
dev.off()