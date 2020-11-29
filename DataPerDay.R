###setup

#load data
setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

#create new dataframe with arrival time data
F3_DataPerDay <- data.frame(F3_full_sheet$x_ScheduledDTTM)

#rename column
colnames(F3_DataPerDay) <- "tempname"
#change datetime to day
F3_DataPerDay$tempname <- as.Date(F3_DataPerDay$tempname)
#remove duplicates
F3_DataPerDay <- data.frame(F3_DataPerDay[duplicated(F3_DataPerDay$tempname)=="FALSE",])
#rename column again
colnames(F3_DataPerDay) <- "Day"

###adding average wait time per day

#pulls rows for each day from original dataframe, averages data, 
#then adds them to the new dataframe
for (i in 1:length(F3_DataPerDay$Day)){
  dayswaitdata <- F3_full_sheet[as.Date(F3_full_sheet$x_ArrivalDTTM)==F3_DataPerDay$Day[i],"Wait"]
  avgdaywait <- mean(dayswaitdata$Wait)
  F3_DataPerDay$AvgWaitTime[i] <- avgdaywait
}
  
  
  
  