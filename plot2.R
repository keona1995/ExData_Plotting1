# plot2.R
# Reproduces graph ExDataCP1Plot2.png
# Based on a truncated version of household_power_consumption.txt
# named truncatedhouseholdpower.csv.
# The code to produce truncatedhouseholdpower.csv is contained in
# file truncateHouseholdPower.R.
#
plot2 <- function() {
  mydata <- read.csv("./truncatedhouseholdpower.csv")
  # PosixCtDate column is saved as a factor. Convert it to POSIXct.
  mydata <- mutate(mydata, PosixCtDate=as.POSIXct(PosixCtDate,tz="GMT"))
  # open the png device
  png(file="./plot2.png",width=480,height=480)
  with(mydata, plot(PosixCtDate,Global_active_power, xlab="", type="n"))
  with(mydata, lines(PosixCtDate,Global_active_power))
  # close the device, always!
  dev.off()
}