##Plot 2

##Download Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./work.zip")

##Unzip and read table
temp1 <- read.table(unz("./work.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)

##Filter on dates
temp2<- temp1[temp1$Date %in% c("1/2/2007", "2/2/2007"),]

##Convert on Global_active_power to numeric
temp3 <- as.numeric(as.character(temp2$Global_active_power))

##Convert dates
temp4 <- strptime(paste(temp2$Date, temp2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Open Graphics Device PNG
png("plot2.png", width = 480, height = 480)

##Make Plot
plot(temp4,temp3, type = "l",xlab="", ylab="Global Active Power (kilowatts)")

##Close Graphics Device
dev.off()
