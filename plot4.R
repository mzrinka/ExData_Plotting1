library(readxl)
#Read in the whole data set
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Obtain relevant data
gbdata<-df[which(df$Date%in%c("2/2/2007","1/2/2007")),]
#Convert Date and Time to Date/Time format and generate a new variable called datetime
gbdata$Date<-as.Date(gbdata$Date,"%d/%m/%Y")
gbdata$datetime<-strptime(paste(gbdata$Date,gbdata$Time),format="%Y-%m-%d %H:%M:%S")
gbdata$Global_active_power<-as.numeric(as.character(gbdata$Global_active_power))
gbdata$Global_reactive_power<-as.numeric(as.character(gbdata$Global_reactive_power))

#Generate Plot 4

par(mfrow=c(2,2),cex=0.65)

#Plot 1
plot_1<-plot(gbdata$datetime,as.numeric(as.character(gbdata$Global_active_power)),type="n",ylab="Global Active Power",xlab="")
lines(gbdata$datetime,as.numeric(as.character(gbdata$Global_active_power)),type="l")

#Plot 2
plot_2<-plot(gbdata$datetime,as.numeric(as.character(gbdata$Voltage)),type="n",ylab="Voltage",xlab="datetime")
lines(gbdata$datetime,as.numeric(as.character(gbdata$Voltage)),type="l")

#Plot 3
plot_3<-plot(gbdata$datetime,gbdata$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(gbdata$datetime,gbdata$Sub_metering_1,type="l",col="black")
lines(gbdata$datetime,gbdata$Sub_metering_2,type="l",col="red")
lines(gbdata$datetime,gbdata$Sub_metering_3,type="l",col="blue")
legend('topright',lty=1,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=0.75)

#Plot_4

plot_4<-plot(gbdata$datetime,as.numeric(as.character(gbdata$Global_reactive_power)),type="n",ylab="Global Reactive Power",xlab="datetime")
lines(gbdata$datetime,as.numeric(as.character(gbdata$Global_reactive_power)),type="l")

dev.copy(png,file="plot4.png",width=480,height=480)

dev.off()