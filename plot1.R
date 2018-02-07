## Peer-Graded Assignment: 'Exploratory Data Analysis' Course Project #1
## part of coursera's nine-week Data Spezialization by Johns Hopkins University

## February 05, 2018
## author:  Thomas Fischer
## email:   tomfischer@qq.com

# Part 01/04 plotting plot01.png

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
hist(power_consumption$Global_active_power,
     col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')


# ----------- Plotting to file -------------------------------------------------
# Construct the plot and save it to a PNG file with a width of 480 pixels 
# and a height of 480 pixels.
png(file = 'plot1.png', height = 480, width = 480)
hist(power_consumption$Global_active_power,
     col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()

