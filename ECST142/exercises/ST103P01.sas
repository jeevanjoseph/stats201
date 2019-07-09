/*
Practice: Performing a Two-Way ANOVA Using PROC GLM

Data were collected to determine whether different dosage levels of a drug have an effect on
 blood pressure for people with one of three types of heart disease. 
 The data are in the stat1.drug data set.

    Examine the data with a vertical line plot. Put BloodP on the Y axis, and DrugDose on the
    X axis, and then stratify by Disease.

    What information can you obtain by looking at the data?


    Test the hypothesis that the means are equal. Be sure to include an interaction term
    if the graphical analysis that you performed indicates that would be advisable.

    What conclusions can you reach at this point?


    To investigate the interaction effect between the two factors, include the SLICE option
    by manually editing the generated code or you can write the code directly.

    Is the effect of DrugDose significant?
*/

proc SGPLOT data=stat1.drug;
	vline DrugDose / group=Disease response=BloodP stat=mean markers;
	format DrugDose dosefmt.; 
RUN;

PROC GLM data=stat1.drug plots=all;
Class drugdose disease;
model BloodP = drugdose disease drugdose*disease;
lsmeans DrugDose*Disease / slice=Disease;
format Drugdose dosefmt.;
store out=modelitems;
run;
quit;

