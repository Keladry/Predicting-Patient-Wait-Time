# Industry-Project-Group-3
> wait_time_model <- lm(Wait ~., data = waitData)
> summary(wait_time_model)


Call:
  lm(formula = Wait ~ ., data = waitData)

Residuals:
  Min      1Q  Median      3Q     Max 
-441.96  -19.59    2.63   24.86  316.02 

Coefficients:
Estimate Std. Error t value Pr(>|t|)


Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)                           31.049680   4.892023   6.347 2.24e-10 ***
  AvgHowEarlyWaiting                    -0.086655   0.011885  -7.291 3.17e-13 ***
  LineCount0                             1.000630   0.193026   5.184 2.19e-07 ***
  FlowCount2                            -2.690965   0.291442  -9.233  < 2e-16 ***
  SchFlowCount4                          2.452192   0.169395  14.476  < 2e-16 ***
  FutFlowCount2                          2.080822   0.322556   6.451 1.13e-10 ***
  AheadCount                            -1.054096   0.022987 -45.855  < 2e-16 ***
  BeforeSlot                             0.144735   0.041454   3.491 0.000481 ***
  AfterSlot                             -0.251491   0.037720  -6.667 2.66e-11 ***
  Median5                                0.258703   0.013579  19.051  < 2e-16 ***
  AvgWaitByTaskTypeLine                  0.004834   0.023582   0.205 0.837584    
  SumTimeToCompleteInProgress            0.008299   0.005722   1.450 0.146955    
  ExpectedDelayNextExam                  0.410723   0.066391   6.186 6.26e-10 ***
  AvgAgePeopleWaiting                   -0.232291   0.050783  -4.574 4.80e-06 ***
  NumCustomersInLastW1                  -1.932721   0.230398  -8.389  < 2e-16 ***
  AvgWaitLastW1                          0.112785   0.014220   7.932 2.26e-15 ***
  SumTimeToCompleteNextSlot             -0.033806   0.027874  -1.213 0.225217    
  WithAndWithoutContrastCountWaiting     1.166226   0.419776   2.778 0.005470 ** 
  WithContrastCountInProgress           -0.285080   0.483799  -0.589 0.555697    
  WithAndWithoutContrastCountInProgress  0.797364   0.754982   1.056 0.290917    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 45.03 on 23563 degrees of freedom
Multiple R-squared:  0.1315,	Adjusted R-squared:  0.1308 
F-statistic: 187.7 on 19 and 23563 DF,  p-value: < 2.2e-16

We can see from the output that since the p-value for the F-statistic is very small, there is at least one of the variables in our model has a significant relationship with our predictor.
Also, according to the p-value corresponding to each predictor’s t-stat, we can say that “AvgWaitByTaskTypeLine”, ”SumTimeToCompleteInProgress”, ”SumTimeToCompleteNextSlot”, “WithContrastCountInProgress”, and ” WithAndWithoutContrastCountInProgress” do not have a statistically significant relationship to the response “wait” because they have high p-values

Checking Model Assumptions:
At this point, we need to check the assumptions of our model to be sure that the model provides accurate results.
# use the plot() function to produce diagnostic plots of our liner regression fit.
par(mfrow = c(2,2))


1-Linearity of Relationship:
The plot shows that there appears to be a linear relationship between the fitted line and the residual value creating a mostly horizontal line (red) at zero in the representation of their relationship.
Also, we can see that there is no pattern in the residual plot. This suggests that we can assume linear relationship between the predictors and the outcome variables.

![residualVsFitted](https://user-images.githubusercontent.com/73409985/103451516-e40e2300-4c92-11eb-8383-47f90d1f4463.png)

2- Normal Distribution of Residuals
The QQ plot of residuals can be used to visually check the normality assumption. The normal probability plot of residuals should approximately follow a straight line.
In our model, though some of the points seem to fall on the line indicates that these points come from a normal distribution, there are a lot of points that stray from the line in the lower and upper quantiles of the plot which suggests that the residuals are not as close to a normal distribution. So, the plot shows the violation of normality.

![normalQ](https://user-images.githubusercontent.com/73409985/103451521-e96b6d80-4c92-11eb-93a6-4b0f82d8cfbb.png)

3-Homoscedasticity or Equal Variance of Variables
This plot is similar to the residual plot, but uses the square root of the standardized residuals instead of the residuals themselves. This makes trends in residuals more evident and, from this plot; we can see that there is likely a line trend in our residuals. Also, we can see that the scatter randomly distributed around the red fitted line in the scale-location graph denotes that the regression residuals were satisfied by homoscedasticity.

![scaleLocation](https://user-images.githubusercontent.com/73409985/103451524-ed978b00-4c92-11eb-94f3-88fd45037958.png)

4- Outliers and high levarage points
The plot highlights the top 3 most extreme points (#3594, #2912 and #3588), with a standardized residuals above 5 and below -5. However, there are no outliers that exceed 3 standard deviations, which is good.
Additionally, there is no high leverage point in the data. That is, all data points, have a leverage statistic below 2(p + 1)/n = 40/23583 = 0.0017.

![residualVsLeverage](https://user-images.githubusercontent.com/73409985/103451526-f0927b80-4c92-11eb-9b1e-f9d726ff7a1d.png)


