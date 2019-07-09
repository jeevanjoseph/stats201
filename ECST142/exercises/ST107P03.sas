/*

Practice: Using PROC LOGISTIC to Perform a Binary Logistic Regression Analysis

The insurance company wants to characterize the relationship between a vehicle's weight and its safety rating. The stat1.safety data set contains the data about vehicle safety.

    Use PROC LOGISTIC to fit a simple logistic regression model with Unsafe as the response variable and Weight as the predictor 
    variable. 
    Use the EVENT= option to model the probability of Below Average safety scores. 
    Request profile likelihood confidence limits, an odds ratio plot, and an effect plot. 
    Submit the code and view the results.


    Do you reject or fail to reject the null hypothesis that all regression coefficients of the model are 0?


    Write the logistic regression equation.


    Interpret the odds ratio for Weight.
    
*/


PROC logistic data=stat1.safety plots(only)=oddsratio effect;
model unsafe(event=1) = weight / clodds=pl 
run;

