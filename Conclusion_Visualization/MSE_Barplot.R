#plots the MSE values for the models we've tried, for easy comparison of effectiveness

#list MSEs calculated from each model
MLR_MSE <- 706.915

RF_MSE_1 <- 662.722
RF_MSE_2 <- 5 #placeholder
  
SVR_MSE_Radial <- 668.398
SVR_MSE_Linear <- 729.173
SVR_MSE_Polynomial <- 710.652

#makes vector of values
MSE_list <- c(MLR_MSE, RF_MSE_1, RF_MSE_2, SVR_MSE_Radial, SVR_MSE_Linear,
              SVR_MSE_Polynomial)
#how much space will be before each bar
barspacing <- c(0, 1, .1, 1, .1, .1)
#labels for bars
barnames <- c("Multiple Linear Regression","Random Forest\n Before Tuning",
              "Random Forest\n After Tuning","SVR\n Radial Kernel",
              "SVR\n Linear Kernel","SVR\n Polynomial Kernel")
#sets colours
colours <- c("#00FF00","#99CCFF","#0033FF","#CC99FF","#9900FF","#663399")

#creates barplot
barplot <- barplot(MSE_list, space=barspacing, names.arg=barnames, col=colours,
        main="Mean Squared Error\n For Various Models", ylab="MSE",
        ylim=c(0,750), axes=TRUE, yaxp = c(0, 750, 15))
#adds text with exact values for each MSE on the corresponding bar
text(barplot, 30, round(MSE_list, 1),cex=1.1,pos=3, font=2) 
