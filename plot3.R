library(readxl)
#Read in the whole data set
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Obtain relevant data
gbdata<-df[which(df$Date%in%c("2/2/2007","1/2/2007")),]
#Convert Date and Time to Date/Time format and generate a new variable called datetime
gbdata$Date<-as.Date(gbdata$Date,"%d/%m/%Y")
gbdata$datetime<-strptime(paste(gbdata$Date,gbdata$Time),format="%Y-%m-%d %H:%M:%S")

#Generate Plot 3

png(filename="plot3.png",width=480,height=480)
plot3<-plot(gbdata$datetime,gbdata$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(gbdata$datetime,gbdata$Sub_metering_1,type="l",col="black")
lines(gbdata$datetime,gbdata$Sub_metering_2,type="l",col="red")
lines(gbdata$datetime,gbdata$Sub_metering_3,type="l",col="blue")
legend('topright',lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()