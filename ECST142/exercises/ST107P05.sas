/* 
Practice: Using PROC LOGISTIC to Perform Backward Elimination; Using PROC PLM to Generate Predictions

The insurance company wants to model the relationship between three of a car's characteristics,
 weight, size, and region of manufacture, and its safety rating. 
 Run PROC LOGISTIC and use backward elimination. 
 Start with a model using only main effects. 
 The stat1.safety data set contains the data about vehicle safety.

    Use PROC LOGISTIC to fit a multiple logistic regression model with Unsafe as the response variable and 
        Weight, Size, and Region as the predictor variables.
        Use the EVENT= option to model the probability of Below Average safety scores.
        Apply the SIZEFMT. format to the variable Size.
        Specify Region and Size as classification variables and use reference cell coding. Specify Asia as the reference level for Region, and 1 (small cars) as the reference level for Size.
        Add a UNITS statement with -1 as the unit for Weight so that you can see the odds ratio for lighter cars over heavier cars.
        Add a STORE statement to save the analysis results as isSafe.
        Request any relevant plots.
        Submit the code and view the results.


    Which terms appear in the final model?


    If you compare these results with those from the previous practice (a model fit with only one variable, Region), do you think that this is a better model?


    Using the final model that was chosen by backward elimination, and using the STORE statement, generate predictive probabilities for the cars in the following DATA step:

    data checkSafety;
       length Region $9.;
       input Weight Size Region $ 5-13;
       datalines;
       4 1 N America
       3 1 Asia     
       5 3 Asia     
       5 2 N America
    	 ;
    run;

 */

proc format;
value sizefmt 1='small' 2='medium' 3='large';
run;

data checkSafety;
   length Region $9.;
   input Weight Size Region $ 5-13;
   datalines;
   4 1 N America
   3 1 Asia     
   5 3 Asia     
   5 2 N America
	 ;
run;

proc logistic data=stat1.safety plots(only)= (oddsratio effect);
class Region(ref='Asia') size(ref='small') / param=reference;
model Unsafe(event='1') = Weight |size |region / clodds=pl selection=backward ;
units weight=-1;
format Size sizefmt. ;
store out=test_safety_model;

run;

proc plm restore=test_safety_model;
score data=checksafety out=test_results/ilink;
run;

proc print data=test_results;
run;