/*

Exercise: Using PROC GLMSELECT to Perform Stepwise Selection

Use the stat1.bodyfat2 data set to identify a set of "best" models. 
Use significance-level model selection techniques.

    With the SELECTION=STEPWISE option, use SELECT=SL in PROC GLMSELECT to identify a 
    set of candidate models that predict PctBodyFat2 as a function of the variables 
    Age, Weight, Height, Neck, Chest, Abdomen, Hip, Thigh, Knee, Ankle, Biceps, Forearm, and Wrist. 
    Use the default values for SLENTRY= and SLSTAY=. Submit the code and view the results.


    Modify the code to specify the forward selection process (FORWARD). 
    Submit the code and view the results.


    How many variables would result from a model using forward selection and a 
    significance-level-for-entry criterion of 0.05, instead of the default SLENTRY= value, 0.50? 
    Modify and submit the code, and view the results.


*/

%LET vars = Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;

PROC glmselect data=stat1.bodyfat2 plots=all;
MODEL PctBodyFat2 = &vars / showpvalues selection=stepwise details=steps select=SL slstay=0.02 slentry=0.02;
RUN;
