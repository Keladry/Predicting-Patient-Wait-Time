##creating correlation heat map to help us find and remove highly correlated variables

setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
library(reshape2)
library(ggplot2)
#load original data
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

#collects columns we decided to remove based on looking at their distributions in histograms
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
idx <- which(colnames(F3_full_sheet) %in% histremove)
#removes columns
F3_after_hist <- F3_full_sheet[,-idx]

#creates correlation matrix for remaining variables and rounds to one decimal place
cormat <- round(cor(F3_after_hist),1)

#reorder function
reorder_cormat <- function(cormat){
  # use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}

#get upper triangle function
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}

# reorder the correlation matrix
cormat <- reorder_cormat(cormat)
upper_tri <- get_upper_tri(cormat)
# melt the correlation matrix (show each correlation only once)
melted_cormat <- melt(upper_tri, na.rm = TRUE)
# create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "black") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))

print(ggheatmap)

#aesthetic formatting, creates labels and colour legend
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.6, 0.7),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
