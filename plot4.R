hhpc = read.table('household_power_consumption.txt',
                  header=TRUE,
                  sep=';',
                  na.strings = "?",
                  colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

hhpc = hhpc[(hhpc$Date == '1/2/2007') | (hhpc$Date == '2/2/2007'),]

hhpc$Date = as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$DateTime = as.POSIXct(paste(hhpc$Date, hhpc$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
with(hhpc,{
    plot(DateTime, Global_active_power, type='l',  xlab='', ylab='Global Active Power')
    plot(DateTime, Voltage, type='l', xlab='datetime')
    plot(DateTime, Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering')
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), bty='n')
    plot(DateTime, Global_reactive_power, type='l', xlab='datetime')
})

dev.copy(png,'plot4.png')
dev.off()