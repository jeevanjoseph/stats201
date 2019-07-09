/* 2 sample t test for testing if changed instruction in german leads to better language skill */

proc univariate data=stat1.german;
 class group;
 var change;
 histogram change / normal kernel;
 run;
 
 proc ttest data=stat1.german plots(shownull)=interval;
 	class group;
 var change;
 run;
 