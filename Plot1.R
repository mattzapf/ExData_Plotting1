#Plot 1 Global Active Power

## Read dataset in.




File <- "household_power_consumption.txt" # file name to read in
hpc <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")# read file name in create dataset
head(hpc)     # Check records and variable names
subsethpc<-subset(hpc, Date %in% c("1/2/2007","2/2/2007")) # Read in only relavent days for analysis
head(subsethpc)

globalactivepower <- as.numeric(subsethpc$Global_active_power) #variable that is shown in Plot 1
png("plot1.png", width=480, height=480) #
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()