/*
Use PROC REG to run a regression model of PctBodyFat2 on Abdomen, Weight, Wrist, and Forearm. 
Create plots of the residuals by the four regressors and by the predicted values, 
and a normal Q-Q plot. Submit the code and view the results.


Do the residual plots indicate any problems with the constant variance assumption?


Are there any outliers indicated by the evidence in any of the residual plots?


Does the Q-Q plot indicate any problems with the normality assumption?
*/

%let vars = Abdomen Weight Wrist Forearm;

PROC reg data=stat1.bodyfat2 plots=all;
Model PctBodyFat2 = &vars;
run;
quit;