/*
Use the ameshousing3 data set to build a model that predicts the sale prices of homes in 
Ames, Iowa, that are 1500 square feet or below, based on various home characteristics.

    Write a PROC GLMSELECT step that predicts the values of SalePrice. 
    Partition the stat1.ameshousing3 data set into a training data set of 
    approximately 2/3 and a validation data set of approximately 1/3. 
    Specify the seed 8675309. 
    Define the Interval and Categorical macro variables as shown below, and 
    use them to specify the inputs. 
    Use stepwise regression as the selection method, Akaike's information criterion (AIC) 
    to add and or remove effects, and average squared error for the 
    validation data to select the best model. 
    Add the REF=FIRST option in the CLASS statement. 
    Submit the code and examine the results.

    %let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
             Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
    %let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
             Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
             Masonry_Veneer Lot_Shape_2 Central_Air;




    Which model did PROC GLMSELECT choose?


    Resubmit the PROC GLMSELECT step. Do not make any changes to it. Does it produce the same results as before?


    In the PROC GLMSELECT statement, change the value of SEED= and submit the modified code. Does it produce the same results as before?

*/

    %let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
             Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
    %let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
             Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
             Masonry_Veneer Lot_Shape_2 Central_Air;
             
PROC GLMSELECT data=stat1.ameshousing3 seed=8675309 plots=all;

CLASS &categorical / param=ref ref=first;
MODEL saleprice = &categorical &interval / showpvalues selection=stepwise(select=AIC choose=validate) details=steps;
partition fraction (validate=.33);
RUN;
Quit;

