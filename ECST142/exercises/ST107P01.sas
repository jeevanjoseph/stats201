
/* 
Using PROC FREQ to Examine Distributions

An insurance company wants to relate the safety of vehicles to several other variables. A score was given to each vehicle model, using the frequency of insurance claims as a basis. The stat1.safety data set contains the data about vehicle safety.

    Use PROC FREQ to create one-way frequency tables for the categorical variables Unsafe, Type, Region, and Size. Submit the code and view the results.


    What is the measurement scale of each of the four variables?


    Do the variables Unsafe, Type, Region, and Size have any unusual values that warrant further investigation?

 */


PROC freq data=stat1.safety;
tables Type Region Size Weight Unsafe;
/* tables (Type Region Size Weight)*Unsafe/chisq; */
run;