library(readxl)
#Read in the whole data set
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Obtain relevant data
gbdata<-df[which(df$Date%in%c("2/2/2007","1/2/2007")),]
#Convert Date and Time to Date/Time format and generate a new variable called datetime
gbdata$Date<-as.Date(gbdata$Date,"%d/%m/%Y")
gbdata$datetime<-strptime(paste(gbdata$Date,gbdata$Time),format="%Y-%m-%d %H:%M:%S")

#Generate Plot 2

png(filename="plot2.png",width=480,height=480)
plot2<-plot(gbdata$datetime,as.numeric(as.character(gbdata$Global_active_power)),type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(gbdata$datetime,as.numeric(as.character(gbdata$Global_active_power)),type="l")
dev.off()