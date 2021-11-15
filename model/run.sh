gen/erl/run -l 110 > outputs/$1.txt

cp outputs/$1.txt data/md/fixed-nodes/scheduling-2A-2C/$1/model.txt

python3 data/scripts/mixedPlot.py data/md/fixed-nodes/scheduling-2A-2C/$1
#python3 plot_scripts/plot.py outputs/$1.txt
