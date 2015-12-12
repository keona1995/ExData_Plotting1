# plot1.R
# Reproduces graph ExDataCP1Plot1.png
# Based on a truncated version of household_power_consumption.txt
# named truncatedhouseholdpower.csv.
# The code to produce truncatedhouseholdpower.csv is contained in
# file truncateHouseholdPower.R.
#
plot1 <- function() {
  mydata <- read.csv("./truncatedhouseholdpower.csv")
  # PosixCtDate column is saved as a factor. Convert it to POSIXct.
  mydata <- mutate(mydata, PosixCtDate=as.POSIXct(PosixCtDate,tz="GMT"))
  # open the png device
  png(file="./plot1.png",width=480,height=480)
  with(mydata, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
  # close the device, always!
  dev.off()
}