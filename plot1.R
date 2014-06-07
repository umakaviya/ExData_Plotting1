setwd("C:/E_Drive/Coursera/Course4")


power<-read.table("assignment1.txt",header = TRUE,sep=";")

mydate = strptime(paste(power$Date,power$Time),format='%d/%m/%Y %H:%M:%S')
newdate<-as.Date(paste(power$Date,sep=""),format='%d/%m/%Y')
power<-cbind(power,mydate,newdate)
power<-power[(power$newdate=="2007-02-01" | power$newdate=="2007-02-02"),]
attach(power)


####plot1
png(filename="plot1.png",width=480,height=480)

hist(Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main ='Global Active Power')

dev.off()

