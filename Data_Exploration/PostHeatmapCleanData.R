#creates a new data file without all of the variables we have decided to remove,
#either from the histograms or because the correlation heatmap showed that they
#were highly correlated (correlation>=|.7|) with a remaining variable

setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
library(writexl)
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

#columns ruled out by histogram analysis
histremove <- c("x_ArrivalDTTM","x_ScheduledDTTM","x_BeginDTTM","SumHowEarlyWaiting",
                "LineCount1","LineCount2","LineCount3","LineCount4","DelayCount",
                "mintime","ThoracicCount","PediatricCount","NeuroCount", "AbdominalCount",
                "VascularCount","CardiacCount","MSKCount","NumScannersUsedToday",
                "SumInProgress","MostRecent1","MostRecent2","MostRecent3",
                "MostRecent4","MostRecent5","StartTime2","StartTime3","StartTime4",
                "IsFirst","IsLast","NoneInProgress","NoneCompleted","NoneInLine",
                "SumWaitByTaskTypeLine","SumDelayWaitingByExamCode","SumDelayInProgress",
                "Month","InProgressSize","AvgWaitLastK1Customers","AvgWaitLastK3Customers",
                "NumCompletedToday","NumCompletedInLastW1","NumCompletedInLastW2",
                "NumCompletedInLastW3","NumCustomersInLastW2","NumCustomersInLastW3",
                "AvgWaitLastW2","AvgWaitLastW3","AvgDelayForDay","MalesWaitingCount",
                "NumAddOnsLastW2","NumScheduledNextSlot","NumScheduledNextW2",
                "SumTimeToCompleteNextW2")
#columns ruled out because they aren't ideal for the regression models we will be using
distinctremove <- c("DayOfWeek","DayOfYear")
#columns ruled out by correlation matrix
corrmatremove <- c("LineCount0Strict","WithContrastCountWaiting","SumWaits","DelayedInLine",
                   "DelayCountLastHour","OutpatientWaitingCount","AvgWaitLastK2Customers",
                   "FlowCount4","SchFlowCount2","FutFlowCount4","SumDelayWaitingInLine",
                   "maxtime","StartTime","NumAddOnsToday")

totalremove <- c(corrmatremove, distinctremove, histremove)

#removes columns
idx <- which(colnames(F3_full_sheet) %in% totalremove)
F3_postmatclean <- F3_full_sheet[,-idx]

#saves new data as xlsx or csv file
#write.csv(F3_postmatclean, "F3_PostMatClean.csv", row.names=FALSE)
#write_xlsx(F3_postmatclean, "F3_PostMatClean.xlsx")
