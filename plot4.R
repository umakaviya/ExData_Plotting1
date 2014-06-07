setwd("C:/E_Drive/Coursera/Course4")


power<-read.table("assignment1.txt",header = TRUE,sep=";")

mydate = strptime(paste(power$Date,power$Time),format='%d/%m/%Y %H:%M:%S')
newdate<-as.Date(paste(power$Date,sep=""),format='%d/%m/%Y')
power<-cbind(power,mydate,newdate)
power<-power[(power$newdate=="2007-02-01" | power$newdate=="2007-02-02"),]
attach(power)



png(filename="plot4.png",width=480,height=480)

##plot4
layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))


####plot4.1
hist(Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main ='Global Active Power')

####plot4.2
plot(mydate,Global_active_power,type ='l',xlab='',ylab='Global Active Power(kilowatts)')

####plot4.3

plot(mydate,Sub_metering_1,type='l',col='black',xlab='',ylab='Energy sub metering')
lines(mydate,Sub_metering_2,type='l',col='red') 
lines(mydate,Sub_metering_3,type='l',col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3') ,lty =1,col=c('black', 'red', 'blue',' brown'),bty='n', cex=.75)

###plot4.4

plot(mydate,Global_reactive_power,type ='l')


dev.off()

