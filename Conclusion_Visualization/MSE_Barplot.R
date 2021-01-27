#plots the MSE values for the models we've tried, for easy comparison of effectiveness

#list MSEs calculated from each model
MLR_MSE <- 705.17

RF_MSE <- 662.722

SVR_MSE_R <- 668.398
SVR_MSE_L <- 729.173
SVR_MSE_P <- 710.652

#makes vector of values
MSE_list <- c(MLR_MSE, SVR_MSE_L, SVR_MSE_P, SVR_MSE_R, RF_MSE)
#how much space will be before each bar
barspacing <- c(.5,1.5,.1,.1,1.5)
#labels for bars
barnames <- c("Linear Regression","SVR\n Linear Kernel","SVR\n Polynomial Kernel",
              "SVR\n Radial Kernel","Random Forest")
#sets colours
green <- "#99FF99"
blue <- "#99CCFF"
purple <- "#CC99FF"
colours <- c(green, blue, blue, blue, purple)

#creates barplot
barplot <- barplot(MSE_list, space=barspacing, names.arg=barnames, col=colours,
                   main="Mean Squared Error For Various Model Types\n The random forest model had the smallest MSE and thus the best performance",
                   ylab="MSE",
                   font.lab=2,ylim=c(0,750), axes=TRUE, yaxp = c(0, 750, 15))
#adds text with exact values for each MSE on the corresponding bar
text(barplot, 30, round(MSE_list, 0),cex=1.1,pos=3, font=2)

