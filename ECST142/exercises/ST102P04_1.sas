/*
Practice: Using PROC REG to Fit a Simple Linear Regression Model

Using the bodyfat2 data set, perform a simple linear regression model.

    Perform a simple linear regression model with PctBodyFat2 as the response variable and Weight as the predictor.


    What is the value of the F statistic and the associated p-value? How would you interpret this in connection with the null hypothesis?


    Write the predicted regression equation.


    What is the value of R-square? How would you interpret this?
*/

PROC reg data=stat1.bodyfat2
		 plots=all;
 model PctBodyFat2=Weight;
 run;