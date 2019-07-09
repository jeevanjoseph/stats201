%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
             Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
             
proc glmselect data=stat1.ameshousing;
model salePrice= &interval / showpvalues selection=stepwise(select=SBC choose=sbc) details=summary ;
partition fraction (test=0.1 validate=0.2);
run;