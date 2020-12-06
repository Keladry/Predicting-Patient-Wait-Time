#tell R where to find the data file and load it
setwd("Documents/Bootcamp_Work/Industry_Project")
library(readxl)
F3_full_sheet <- read_excel("CodeandData/Data/WaitData.Published.xlsx", sheet = 3)

#take out just the columns I care about
startcol <- which(colnames(F3_full_sheet)=="ThoracicCount")
endcol <- which(colnames(F3_full_sheet)=="NoneInProgress")
mycolumns <- F3_full_sheet[,startcol:endcol]

#make and save histograms for each column
for (i in 1:length(mycolumns)){
  graphname <- colnames(mycolumns)[i]
  nameoffile <- paste(graphname, ".png", sep="")
  datacol <- sapply(mycolumns[, i], as.numeric)
  png(filename=nameoffile)
  hist(datacol, col="#66FFFF", main=graphname, xlab=graphname)
  dev.off()
}