## Peer-Graded Assignment: 'Exploratory Data Analysis' Course Project #1
## part of coursera's nine-week Data Spezialization by Johns Hopkins University

## February 06, 2018
## author:  Thomas Fischer
## email:   tomfischer@qq.com

# Part 04/04 plotting plot04.png

# ----------- Getting Data -----------------------------------------------------
setwd('C:/Users/user/Documents/GitHub/ExploratoryDataAnalysisProject01/')
rm(list = ls())
dir('./data')

# Load data in data.table object
require(data.table)
power_consumption <- fread(file = 'data/household_power_consumption.txt',
                           na.strings = '?'
)

# The dataset has 2,075,259 rows and 9 columns.
dim(power_consumption)
head(power_consumption)

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
power_consumption <- power_consumption[Date == '1/2/2007' | Date == '2/2/2007']
power_consumption[, datetime := 
                      as.POSIXct(paste(Date, Time), 
                                 "%d/%m/%Y %H:%M:%S", 
                                 tz = '')]

sapply(power_consumption, range)

# ----------- Plotting on screen -----------------------------------------------

# actually there are four plots
par(mfrow = c(2,2))
# 1
with(power_consumption, plot(x = datetime,
                             y = Global_active_power,
                             type = 'l',
                             xlab = '',
                             ylab = 'Global Active Power'))
# 2
with(power_consumption, plot(x = datetime,
                             y = Voltage,
                             type = 'l',
                             xlab = 'datetime',
                             ylab = 'Voltage'))
# 3
with(power_consumption,
     plot(x = datetime,
          y = Global_active_power,
          type = 'n',
          xlab = '',ylim = c(0,38),
          ylab = 'Energy sub metering'))
with(power_consumption,
     {   points(x = datetime,
                y = Sub_metering_1,
                type = 'l')
         points(x = datetime,
                y = Sub_metering_2,
                type = 'l',
                col = 'red')
         points(x = datetime,
                y = Sub_metering_3,
                type = 'l',
                col = 'blue')})
legend('topright',
       col = c('black', 'red', 'blue'),
       lty = 1,
       lwd = 2,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
# 4
with(power_consumption, plot(x = datetime,
                             y = Global_reactive_power,
                             type = 'l'))

# ----------- Plotting to file -------------------------------------------------
# Construct the plot and save it to a PNG file with a width of 480 pixels 
# and a height of 480 pixels.
png(file = 'plot4.png', height = 480, width = 480)
par(mfrow = c(2,2))
# 1
with(power_consumption, plot(x = datetime,
                             y = Global_active_power,
                             type = 'l',
                             xlab = '',
                             ylab = 'Global Active Power'))
# 2
with(power_consumption, plot(x = datetime,
                             y = Voltage,
                             type = 'l',
                             xlab = 'datetime',
                             ylab = 'Voltage'))
# 3
with(power_consumption,
     plot(x = datetime,
          y = Global_active_power,
          type = 'n',
          xlab = '',ylim = c(0,38),
          ylab = 'Energy sub metering'))
with(power_consumption,
     {   points(x = datetime,
                y = Sub_metering_1,
                type = 'l')
         points(x = datetime,
                y = Sub_metering_2,
                type = 'l',
                col = 'red')
         points(x = datetime,
                y = Sub_metering_3,
                type = 'l',
                col = 'blue')})
legend('topright',
       col = c('black', 'red', 'blue'),
       lty = 1,
       lwd = 2,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
# 4
with(power_consumption, plot(x = datetime,
                             y = Global_reactive_power,
                             type = 'l'))
dev.off()

