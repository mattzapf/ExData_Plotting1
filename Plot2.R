#Plot 2 Global Active Power

## Read dataset in.




File <- "household_power_consumption.txt" # file name to read in
hpc <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")# read file name in create dataset
head(hpc)     # Check records and variable names
subsethpc<-subset(hpc, Date %in% c("1/2/2007","2/2/2007")) # Read in only relavent days for analysis
head(subsethpc)


datetime <- strptime(paste(subsethpc$Date, subsethpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #converting the date and time variables to a datetime variable
globalactivepower <- as.numeric(subsethpc$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)") # Plot globalactivepower variable against the datetime variable
dev.off()