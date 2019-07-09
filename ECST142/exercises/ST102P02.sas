/*
Consider the analysis of the garlic data set. In the previous exercise, you used PROC GLM to perform one-way ANOVA, and found that there was a statistically significant difference among mean garlic bulb weights for the different fertilizers. Now, perform a post hoc test to look at the individual differences among means.

    Use PROC GLM to conduct pairwise comparisons with an experimentwise error rate of α=0.05. (Use the Tukey adjustment.) Submit the code and view the results.


    Which types of fertilizer are significantly different?


    Use level 4 (the chemical fertilizer) as the control group and perform a Dunnett's comparison with the organic fertilizers to see whether they affected the average weights of garlic bulbs differently from the control fertilizer.


    Which types of fertilizer are significantly different?


    Challenge: Perform unadjusted tests of all pairwise comparisons to see what would happen if the multi-test adjustments were not made.


    How do the results compare to what you saw in the Tukey adjusted tests?
*/

 proc glm data=stat1.garlic plots=diagnostics;
 class fertilizer;
 model bulbwt = fertilizer;
 means fertilizer / hovtest=levene;
 
 lsmeans fertilizer / pdiff=all adjust=tukey;
 lsmeans fertilizer / pdiff=control('4') adjust=dunnett;
 
 run;