/*

Montana Gourmet Garlic is a company that uses organic methods to grow garlic. It specializes in hardneck varieties. Knowing a little about experimental methods, the owners design an experiment to test whether growth of the garlic is affected by the type of fertilizer. They limit the experimentation to a Rocambole variety named Spanish Roja, and test three organic fertilizers and one chemical fertilizer (as a control). They "blind" themselves to the fertilizer by using containers with numbers 1 through 4. (In other words, they design the experiment in such a way that they do not know which fertilizer is in which container.) One acre of farmland is set aside for the experiment. The land is divided into 32 beds, and they randomly assign fertilizers to the beds. At harvest, they calculate the average weight of garlic bulbs in each of the beds. The data are in the stat1.garlic data set.
Consider an experiment to study four types of fertilizer, labeled 1, 2, 3, and 4. One fertilizer is chemical and the rest are organic. You want to see whether the average weights of the garlic bulbs are significantly different for plants in beds that use different fertilizers.

    Test the hypothesis that the means are equal. Use PROC MEANS to generate descriptive statistics for the two groups, and use PROC SGPLOT to produce box plots of bulb weight for the four groups. Submit the code and view the results.


    Which fertilizer has the highest mean?


    Perform a one-way ANOVA using PROC GLM. Be sure to check that the assumptions of the analysis method that you choose are met. Submit the code and view the results.


    What conclusions can you reach at this point in your analysis? 
*/

proc means data=stat1.garlic;
 class  fertilizer;
 var bulbwt;
 run;
 
 proc sgplot data=stat1.garlic;
 	vbox bulbwt / category= fertilizer connect=mean;
 run;
 
 proc glm data=stat1.garlic plots=diagnostics;
 class fertilizer;
 model bulbwt = fertilizer;
 means fertilizer / hovtest=levene;
 run;