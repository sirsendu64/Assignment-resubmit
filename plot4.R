> # read data
> consumption <- read.csv("Power_Data.csv", header = TRUE, sep = ",")
>                      
> 
> # convert data to class 'Date'
> consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
> 
> fromDate <- as.Date("2007-02-01"); toDate   <- as.Date("2007-02-02")
> 
> # subset dataset to target dates February 1 and 2, 2007
> consumption<-consumption[(consumption$Date >= fromDate & consumption$Date <= toDate),]
> 
> # open graphics device
> png("plot4.png", width = 480, height = 480)
> 
> # specify two rows & two columns for the plot
> par(mfrow = c(2,2))
> 
> # for the topleft plot, repeat plot2
> # sampleColors <- sample(colors(distinct = T),1) # select a color
> plot(x=as.ts(consumption$Global_active_power), ylab = "Global Active Power (kilowatts)", xaxt = 'n', xlab = "")                                
> # remove automated x axis labels
> axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))
> 
> # for the topright, plot voltage
> # sampleColors <- sample(colors(distinct = T),1) # select a color
> plot(x = as.ts(consumption$Voltage), ylab = "Voltage", xaxt = 'n', xlab = "datetime")
> 
> # for the bottomleft, repeat plot3
> # sampleColors <- sample(colors(distinct = T),1) # select a color
> plot(as.numeric(consumption$Sub_metering_1), ylab = "Energy sub metering", xaxt = 'n', xlab = "", type = 'l', ylim = c(0,40))
> 
> # label Thursday, Friday, Saturday
> axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))
> 
> # add Sub_metering 2 and 3
> lines(as.numeric(consumption$Sub_metering_2), col = "red")
> lines(as.numeric(consumption$Sub_metering_3), col = "blue")
> legend("topright", legend = paste("Sub_metering",1:3,sep = "_"), fill = c("black","red","blue"))
> 
> # for the bottomright, plot global reactive power
> # sampleColors <- sample(colors(distinct = T),1) # select a color
> plot(x = as.ts(consumption$Global_reactive_power), ylab = "Global_reactive_power", xaxt = 'n', xlab = "datetime")
> 
> # close graphics device
> dev.off() 
null device 
          1 
> 
