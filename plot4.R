# plot4.R
# Reproduces graph ExDataCP1Plot4.png
# Based on a truncated version of household_power_consumption.txt
# named truncatedhouseholdpower.csv.
# The code to produce truncatedhouseholdpower.csv is contained in
# file truncateHouseholdPower.R.
#
plot4 <- function() {
  mydata <- read.csv("./truncatedhouseholdpower.csv")
  # PosixCtDate column is saved as a factor. Convert it to POSIXct.
  mydata <- mutate(mydata, PosixCtDate=as.POSIXct(PosixCtDate,tz="GMT"))
  # open the png device
  png(file="./plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
  # 1st plot top row
  with(mydata, plot(PosixCtDate,Global_active_power, type="n", xlab="",ylab="Global Active Power"))
  with(mydata,lines(PosixCtDate, Global_active_power))
  # 2nd plot top row
  with(mydata, plot(PosixCtDate,Voltage, type="n", xlab="datetime",ylab="Voltage"))
  with(mydata, lines(PosixCtDate, Voltage))
  # 1st plot bottom row
  with(mydata,plot(PosixCtDate,Sub_metering_1,ylab="Energy sub metering", xlab="", type="n"))
  with(mydata,lines(PosixCtDate,Sub_metering_1,col="black"))
  with(mydata,lines(PosixCtDate,Sub_metering_2,col="red"))
  with(mydata,lines(PosixCtDate,Sub_metering_3,col="blue"))
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # 2nd plot bottom row
  with(mydata, plot(PosixCtDate,Global_reactive_power, type="n", xlab="datetime",
                    ylab="Global_reactive_power"))
  with(mydata, lines(PosixCtDate, Global_reactive_power))
  
  # close the device, always!
  dev.off()
}