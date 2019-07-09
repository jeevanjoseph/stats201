/*

Practice: Using PROC REG to Assess Collinearity

Run a regression of PctBodyFat2 on all the other numeric variables in the data set stat1.bodyfat2.

    Write a PROC REG step to determine whether a collinearity problem exists in your model. 
    Submit the code and view the results.


    If there is a collinearity problem, what would you like to do about it? Will you remove any variables? 
    Why or why not?
*/


%LET vars = Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;


PROC REG data=stat1.bodyfat2;
MODEL PctBodyFat2 = &vars /vif;
run;
quit;

PROC corr data=stat1.bodyfat2;
var &vars;
with Weight;
run; 

PROC GLMSELECT data=stat1.bodyfat2 plots=all;
model pctbodyfat2 = &vars / showpvalues selection=stepwise select=sl slstay=0.05 slentry=0.05 details=steps;
run;
quit;