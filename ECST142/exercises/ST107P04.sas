/* 

Practice: Using PROC LOGISTIC to Perform a Multiple Logistic Regression Analysis with Categorical Variables

The insurance company wants to model the relationship between three of a car's characteristics, weight, 
size, and region of manufacture, and its safety rating. The stat1.safety data set contains the data about 
vehicle safety.

    Use PROC LOGISTIC to fit a multiple logistic regression model with Unsafe as the response variable 
    and Weight, Size, and Region as the predictor variables.
    
        Use the EVENT= option to model the probability of Below Average safety scores.
        Specify Region and Size as classification variables and use reference cell coding. 
        Specify Asia as the reference level for Region, and 3 (large cars) as the reference level for Size.
        Request profile likelihood confidence limits, an odds ratio plot, and the effect plot.
        Submit the code and view the results.



    Do you reject or fail to reject the null hypothesis that all regression coefficients of the model are 0?


    If you reject the global null hypothesis, then which predictors significantly predict safety outcome?


    Interpret the odds ratio for significant predictors.


 */

PROC LOGISTIC data=stat1.safety plots(only)=(effect oddsratio);
class region(ref='Asia') size(ref='3') / param=ref;
model Unsafe(event='1') = region size weight / clodds=pl;
run;