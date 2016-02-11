> # read data
> consumption <- read.csv("Power_Data.csv", header= TRUE, sep = "," )
>                      
> 
> # convert data to class 'Date'
> consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
> 
> fromDate <- as.Date("2007-02-01"); toDate   <- as.Date("2007-02-02")
> 
> # subset dataset to target dates February 1 and 2, 2007
> consumption<-consumption[(consumption$Date >= fromDate & consumption$Date <= toDate),]
> # open graphics device
> png("plot3.png" , width = 480, height = 480)
> # plot Sub_metering_1
> plot(as.numeric(consumption$Sub_metering_1), ylab = "Energy sub metering", xaxt = 'n', xlab = "", type = 'l', ylim = c(0,40))
> # label Thursday, Friday, Saturday 
> axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))
> # add Sub_metering 2 and 3
> lines(as.numeric(consumption$Sub_metering_2), col = "red")
> lines(as.numeric(consumption$Sub_metering_3), col = "blue")
> # add legend
> legend("topright", legend = paste("Sub_metering",1:3,sep = "_"), fill = c("black","red","blue"))
> # close graphics device
> dev.off() 
null device 
          1 
> 
