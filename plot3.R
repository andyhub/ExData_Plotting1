hhpc = read.table('household_power_consumption.txt',
                  header=TRUE,
                  sep=';',
                  na.strings = "?",
                  colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

hhpc = hhpc[(hhpc$Date == '1/2/2007') | (hhpc$Date == '2/2/2007'),]

hhpc$Date = as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$DateTime = as.POSIXct(paste(hhpc$Date, hhpc$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
with(hhpc, {
    plot(DateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black', ylim=c(0,38))
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
}
)

dev.copy(png,'plot3.png')
dev.off()