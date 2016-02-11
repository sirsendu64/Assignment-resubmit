> consumption <- read.csv("Power_Data.csv", header= TRUE, sep= ",")
> # convert data to class 'Date'
> consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
> fromDate <- as.Date("2007-02-01"); toDate   <- as.Date("2007-02-02")
> # subset dataset to target dates February 1 and 2, 2007
> consumption<-consumption[(consumption$Date >= fromDate & consumption$Date <= toDate),]
> # open graphics device 
> png("plot2.png", width =480, height= 480) 
> # plot global active power:
> plot(x=as.ts(consumption$Global_active_power), # works best as time series
+      ylab = "Global Active Power (kilowatts)", # label
+      xlab = "",
+      xaxt = 'n') # remove automated x axis labels
> # label Thursday, Friday, Saturday
> axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))
> 
> # close graphics device
> dev.off() 
null device 
          1 
> 
