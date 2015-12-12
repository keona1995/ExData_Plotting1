# plot3.R
# Reproduces graph ExDataCP1Plot3.png
# Based on a truncated version of household_power_consumption.txt
# named truncatedhouseholdpower.csv.
# The code to produce truncatedhouseholdpower.csv is contained in
# file truncateHouseholdPower.R.
#
plot3 <- function() {
  mydata <- read.csv("./truncatedhouseholdpower.csv")
  # PosixCtDate column is saved as a factor. Convert it to POSIXct.
  mydata <- mutate(mydata, PosixCtDate=as.POSIXct(PosixCtDate,tz="GMT"))
  # open the png device
  png(file="./plot3.png",width=480,height=480)
  with(mydata,plot(PosixCtDate,Sub_metering_1,ylab="Energy sub metering", 
                   xlab="", type="n"))
  with(mydata,lines(PosixCtDate,Sub_metering_1,col="black"))
  with(mydata,lines(PosixCtDate,Sub_metering_2,col="red"))
  with(mydata,lines(PosixCtDate,Sub_metering_3,col="blue"))
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # close the device, always!
  dev.off()
}