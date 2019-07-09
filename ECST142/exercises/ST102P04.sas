%let interval=Age Weight Height Neck Chest Abdomen Hip 
              Thigh Knee Ankle Biceps Forearm Wrist;
              
proc corr data=stat1.bodyfat2
			plots=scatter(nvar=all ellipse=none);
			
 var &interval;
 with PctBodyFat2;
 id Case;

run;

%let interval=Biceps Forearm Wrist;

ods graphics / reset=all imagemap;
ods select scatterplot;
proc corr data=STAT1.BodyFat2
          plots(only)=scatter(nvar=all ellipse=none);
   var &interval;
   with PctBodyFat2;
   id Case;
   title "Correlations and Scatter Plots";
run;