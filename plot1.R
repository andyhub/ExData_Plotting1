hhpc = read.table('household_power_consumption.txt',
                  header=TRUE,
                  sep=';',
                  na.strings = "?",
                  colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

hhpc = hhpc[(hhpc$Date == '1/2/2007') | (hhpc$Date == '2/2/2007'),]

hhpc$Date = as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$DateTime = as.POSIXct(paste(hhpc$Date, hhpc$Time), format="%Y-%m-%d %H:%M:%S")


par(mfrow=c(1,1))
hist(hhpc$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.copy(png,'plot1.png')
dev.off()