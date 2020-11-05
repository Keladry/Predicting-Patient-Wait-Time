setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

#check for missing values
colSums(is.na(F3_full_sheet))

## min, mean, max
summary(F3_full_sheet$ThoracicCount)
#0, 4.3, 14
summary(F3_full_sheet$PediatricCount)
#0, .004, 2
summary(F3_full_sheet$NeuroCount)
#0, .46, 6
summary(F3_full_sheet$AbdominalCount)
#0, 1.3, 9
summary(F3_full_sheet$VascularCount)
#0, .37, 6
summary(F3_full_sheet$CardiacCount)
#0, .0007, 1
summary(F3_full_sheet$MSKCount)
#0, .27, 4
#look up avg. times for these types of exams?

summary(F3_full_sheet$NumScannersUsedToday)
table(F3_full_sheet$NumScannersUsedToday)
#0 used 2643 times, 1 used 1379 times, 2 used 19,561 times
#probably hospital just has two that usually get used

summary(F3_full_sheet$SumInProgress)
#0, 29.76, 671
#want to see how this relates to time of day
#could help us figure out which types of exams take the longest

summary(F3_full_sheet$BeforeSlot)
#time since last appointment slot
#0, 7.9, 106
#useful in relation to scheduled appointment times?

summary(F3_full_sheet$AfterSlot)
#time until next appointment slot
#0, 12, 102
#could be compared to departures- how long is left after people leave?

summary(F3_full_sheet$Median5)
#-347, 19, 124
nrow(F3_full_sheet[F3_full_sheet$Median5 < 0,])
#3043 instances where Median5 is negative, why?

summary(F3_full_sheet$MostRecent1)
#-492, 17.66, 371
nrow(F3_full_sheet[F3_full_sheet$MostRecent1 < 0,])
#5025 instances where the most recent patient had negative wait time
summary(F3_full_sheet$MostRecent2)
#-415, 17.59, 342
summary(F3_full_sheet$MostRecent3)
#-492, 17.9, 323
summary(F3_full_sheet$MostRecent4)
#-415, 17.01, 357
summary(F3_full_sheet$MostRecent5)
#-405, 16.35, 308
#as expected, these are pretty similar- we probably only need to use one

#Definitely need to ask about StartTime columns

nrow(F3_full_sheet[F3_full_sheet$IsLast == 1,])
#582 last patients
nrow(F3_full_sheet[F3_full_sheet$IsFirst == 1,])
#621 first patients
#these will help us remove unnecessary data in certain situations
#ex. no use in looking at last 5 wait times for the first patient
#also worth checking why the counts of these are different- certain days have
#    incomplete data, so we might want to find those

summary(F3_full_sheet$NoneInProgress)
table(F3_full_sheet$NoneInProgress)
#true 4910 times, false 18673 times
nrow(F3_full_sheet[(F3_full_sheet$IsFirst == 1) & (F3_full_sheet$NoneInProgress == 1),])
nrow(F3_full_sheet[(F3_full_sheet$IsFirst == 0) & (F3_full_sheet$NoneInProgress == 1),])
#555 of the true instances are because the patient was the first of the day
#4355 of the true instances were not the first patient, should look more into those