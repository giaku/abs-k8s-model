gen\erl\run -l 110 > outputs\%1.txt && cd .. && cd .. && copy /y outputs\%1.txt data\md\mixed_wf_2nd_scheduling\%1\model.txt 
:: && python data\scripts\mixedPlot.py data\md\mixed_wf\%1 
:: && python plot_scripts\plot.py outputs\%1.txt

