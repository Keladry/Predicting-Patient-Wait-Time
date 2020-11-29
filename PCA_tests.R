setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

#list columns to be removed
unwanted_cols <- c("x_ArrivalDTTM","x_ScheduledDTTM","x_BeginDTTM","NumScannersUsedToday",
                   "StartTime","StartTime2","StartTime3","StartTime4","IsLast","IsFirst",
                   "NoneInProgress","NoneCompleted","NoneInLine","SumWaitByTaskTypeLine",
                   "AvgWaitByTaskTypeLine","SumDelayWaitingByExamCode","DayOfWeek","Month",
                   "DayOfYear","WithContrastCountWaiting","WithAndWithoutContrastCountWaiting",
                   "WithContrastCountInProgress","WithAndWithoutContrastCountInProgress")
#check number of unwanted columns (helps check if everything is working)
length(unwanted_cols)
#creates new dataframe with unwanted columns removed
F3_for_pca_withwait <- F3_full_sheet[, !colnames(F3_full_sheet) %in% unwanted_cols ]

#run pca with wait time included as a dimension
F3.pca.withwait <- prcomp(F3_for_pca_withwait, center=TRUE, scale.=TRUE)
summary(F3.pca.withwait)
#well that was useless but here's some plots anyway
library(factoextra)
fviz_pca_var(F3.pca.withwait)
fviz_pca_biplot(F3.pca.withwait)

#remove wait column
F3_for_pca_nowait <- F3_for_pca_withwait[,-1]
#run pca without wait time included
F3.pca.nowait <- prcomp(F3_for_pca_nowait, center=TRUE, scale.=TRUE)
summary(F3.pca.nowait)
#still hard to tell anything, here's some plots
fviz_pca_var(F3.pca.nowait)
fviz_pca_biplot(F3.pca.nowait)

##let's try smaller subsets of columns
#stats on the number of people in line
inline_cols <- c("LineCount0Strict","LineCount0","ThoracicCount","PediatricCount",
                 "NeuroCount","AbdominalCount","VascularCount","CardiacCount","MSKCount",
                 "OutpatientWaitingCount")
length(inline_cols)
F3_inlinestats <- F3_full_sheet[,inline_cols]
F3.pca.inline <- prcomp(F3_inlinestats, center=TRUE, scale.=TRUE)
summary(F3.pca.inline)
fviz_pca_var(F3.pca.inline)
fviz_pca_biplot(F3.pca.inline)
#   pediatric and cardiac numbers end up on a different axis from all the rest
#that again, but with wait time
F3_inlinestats2 <- F3_full_sheet[,c(inline_cols, "Wait")]
F3.pca.inline2 <- prcomp(F3_inlinestats2, center=TRUE, scale.=TRUE)
summary(F3.pca.inline2)
fviz_pca_var(F3.pca.inline2)
fviz_pca_biplot(F3.pca.inline2)
#   of the special exam types, wait time is most closely correlated with cardiac and pediatric
#   linear regression shows Wait .09% explained by CardiacCount and .003% by PediatricCount
#   (se linearregressiontests file for code)
#   CardiacCount has max 1, so can't do linear regression with just 1 value
#   PediatricCount has max 2, but explains .07% of variance in Wait for nonzero rows
#   for rows where either is nonzero, sum of the two explains .001% of Wait