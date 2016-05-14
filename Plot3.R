#Plot3 Global Active Power

## Read dataset in.




File <- "household_power_consumption.txt" # file name to read in
hpc <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")# read file name in create dataset
head(hpc)     # Check records and variable names
subsethpc<-subset(hpc, Date %in% c("1/2/2007","2/2/2007")) # Read in only relavent days for analysis
head(subsethpc)


datetime <- strptime(paste(subsethpc$Date, subsethpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #converting the date and time variables to a datetime variable
globalactivepower <- as.numeric(subsethpc$Global_active_power)

#submetering variables
submetering1 <- as.numeric(subsethpc$Sub_metering_1)
submetering2 <- as.numeric(subsethpc$Sub_metering_2)
submetering3 <- as.numeric(subsethpc$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
