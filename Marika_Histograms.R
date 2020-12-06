####tell R where to find the data file and load it
##you must change the file paths to match what's on your computer
setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

####take out just the columns I care about
##you must change the column names to the ones you are interested in
startcol <- which(colnames(F3_full_sheet)=="SumHowEarlyWaiting")
endcol <- which(colnames(F3_full_sheet)=="WithAndWithoutContrastCountInProgress")
#makes new dataframe containing just the columns you want
mycolumns <- F3_full_sheet[,startcol:endcol]

####make and save histograms for each column- loop runs for each column in the mycolumns dataframe
for (i in 1:length(mycolumns)){
  #saves name of column to be used as graph and file title
  graphname <- colnames(mycolumns)[i]
  #creates name that the file will be saved under: "graphname.png"
  nameoffile <- paste(graphname, ".png", sep="")
  #picks the ith column from the dataframe and makes it numeric class so that it can be used with hist
  datacol <- sapply(mycolumns[, i], as.numeric)
  #opens new png file and names it
  png(filename=nameoffile)
  #makes histogram with blue colour and title and label based on the data column name
  hist(datacol, col="#66FFFF", main=graphname, xlab=graphname)
  #closes and saves png file- look in your working directory folder to find the plots
  dev.off()
}
