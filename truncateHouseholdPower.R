# truncateHouseholdPower.R
# 
# Based on household_power_consumption.txt
# The code below truncates the original data file to just the rows necessary.
# The Date and Time column are combined, then converted to POSIXct for easy
# handling of time. The smaller file is written to truncatedhouseholdpower.csv,
# which turns out to be much easier to work with, especially for repeating
# experiments on different days.
# 
#
truncateHouseholdPower <- function() {
  pwr <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", stringsAsFactors = FALSE)
  # paste Date and Time to make a new string column
  pwr <- mutate(pwr, DateTime=paste(pwe$Date,pwr$Time))
  # get rid of the first two columns
  pwr <- select(pwr,Global_active_power:DateTime)
  # convert the DateTime column to POSIXct
  pwr <- mutate(pwr, PosixCtDate = as.POSIXct(DateTime,format="%d/%m/%Y %H:%M:%S",tz="GMT"))
  # move PosixCtDate to the first column and select all other columns but DateTime
  pwr <- select(pwr,PosixCtDate,Global_active_power:Sub_metering_3)
  # determine the start time for selecting rows
  posixstart <- as.POSIXct("2007-01-31 23:59:00",tz="GMT")
  # determine the end time for selecting rows
  posixend <- as.POSIXct("2007-02-03",tz="GMT")
  pwr2 <- pwr[(pwr$PosixCtDate >= posixstart & pwr$PosixCtDate <= posixend),]
  write.csv(pwr2, file="./truncatedhouseholdpower.csv", row.names=FALSE)
  
}