##Plot 4

##Download Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./work.zip")

##Unzip and read table
temp1 <- read.table(unz("./work.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)

##Filter on dates
temp2<- temp1[temp1$Date %in% c("1/2/2007", "2/2/2007"),]

##Convert on Sub_metering variables to numeric
temp3_1 <- as.numeric(as.character(temp2$Sub_metering_1))
temp3_2 <- as.numeric(as.character(temp2$Sub_metering_2))
temp3_3 <- as.numeric(as.character(temp2$Sub_metering_3))

##Convert dates
temp4 <- strptime(paste(temp2$Date, temp2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Convert Global Active Power variable
temp5 <- as.numeric(as.character(temp2$Global_active_power))

##Convert Global Reactive Power variable
temp6 <- as.numeric(as.character(temp2$Global_reactive_power))

##Convert Voltage variable
temp7 <- as.numeric(as.character(temp2$Voltage))

##Open Graphics Device PNG
png("plot4.png", width = 480, height = 480)

##Make Plot

##Create 2 by 2 graph
par(mfrow = c(2,2))

##Plot Global Active Power
plot(temp4,temp5, type = "l",xlab="", ylab="Global Active Power")

##Plot Global Reactive Power
plot(temp4,temp7, type = "l",xlab="datetime", ylab="Voltage")

##Plot Sub Metering
plot(temp4, temp3_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(temp4, temp3_2, type = "l", col="red")
lines(temp4, temp3_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =, lwd = 2.5, col=c("black", "red", "blue"), bty = "n")

##Plot Global Reactive Power
plot(temp4,temp6, type = "l",xlab="datetime", ylab="Global_reactive_power")

##Close Graphics Device
dev.off()
