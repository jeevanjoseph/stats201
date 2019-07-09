/*

Practice: Performing Multiple Regression Using PROC REG
Using the stat1.bodyfat2 table, fit a multiple regression model with multiple predictors, and then modify the model by removing the least significant predictors.

    Run a regression of PctBodyFat2 on the variables Age, Weight, Height, Neck, Chest, Abdomen, Hip, Thigh, Knee, Ankle, Biceps, Forearm, and Wrist.

    Note: Turn off ODS Graphics.

    Compare the ANOVA table with this one from the model with only Weight. What is different?
    Analysis of Variance
    Source 	DF 	Sum of Squares 	Mean Square 	F Value 	Pr > F
    Model 	1 	6593.01614 	6593.01614 	150.03 	<.001
    Error 	250 	10986 	43.94389 	  	 
    Corrected Total 	251 	17579 	  	  	 


    How do the R-Square and the adjusted R-Square compare with these statistics for the Weight regression?
    Root MSE 	6.62902 	R-Square 	0.3751
    Dependent Mean 	19.15079 	Adj R-Sq 	0.3726
    Coeff Var 	34.61485 	  	 


    Did the estimate for the intercept change? Did the estimate for the coefficient of Weight change?


    To simplify the model, rerun the model from step 1, but eliminate the variable with the highest p-value. Compare the output with the model from step 1.


    Did the p-value for the model change?


    Did the R-Square and the adjusted R-Square values change?


    Did the parameter estimates and their p-values change?


    To simplify the model further, rerun the model from step 5, but eliminate the variable with the highest p-value. How did the output change from the previous model?


    Did the number of parameters with p-values less than 0.05 change?


*/

%let var = Age Weight Height Neck  Abdomen Hip Thigh  Ankle Biceps Forearm Wrist; 

proc reg data=stat1.bodyfat2;
Model PctBodyfat2 = &var;
Run;
quit;