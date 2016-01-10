library(readxl)
#Read in the whole data set
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Obtain relevant data
gbdata<-df[which(df$Date%in%c("2/2/2007","1/2/2007")),]
#Convert Date and Time to Date/Time format and generate a new variable called datetime
gbdata$Date<-as.Date(gbdata$Date,"%m/%d/%Y")
gbdata$datetime<-strptime(paste(gbdata$Date,gbdata$Time),format="%Y-%m-%d %H:%M:%S")

#Generate Plot 1

png(filename="plot1.png",width=480,height=480)
plot1<-hist(as.numeric(as.character(gbdata$Global_active_power)),col="red",xlab="Global Active Power (Kilowatts)", main="Global Active Power")
dev.off()