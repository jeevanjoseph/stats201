/* ST101p01*/

Proc univariate data=stat1.normtemp;
 var BodyTemp HeartRate;
 histogram BodyTemp HeartRate / normal kernel;
run;

proc ttest data=stat1.normtemp 
		   plots(shownull)=interval
           h0=98.6;
           var bodytemp;
           run;
           