# -*- coding: utf-8 -*-
"""
Created on Sat Apr 10 14:12:09 2021

@author: Utente
"""

# Import the necessary packages and modules
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
import output_p as out
import numpy as np


def tuplesToLists(tupleList):
    """
    Converts a list of tuples of size n into a list of n lists of values, one for
    each element of the tuple
    
    [(x11,...,x1n),...,(xm1,...,xmn)] -> [[x11,...,xm1],...,[x1n,...,xmn]]

    Parameters
    ----------
    tupleList : A list of homogeneous size tuples
        the list to be converted.

    Returns
    -------
    result : list of lists
        the resulting list

    """
    size = len(tupleList[0])
    result = list()
    for i in range(size):
        result.append(list())
    for t in tupleList:
        for i in range(size):
            result[i].append(t[i])
            
    return result


def formatDataToPlot(data):
    
    result = list()
    
    for k in data.keys():
        valuesList = data.get(k)
        lists = tuplesToLists(valuesList)
        xs = lists[0]
        ys = lists[1]
        result.append((k,xs,ys))
    
    return result
    for k in data:
        vList = data.get(k)
        xs,ys = tuplesToLists(vList)
        result.append((k,xs,ys))
        
    return result

def formatPodDataByNode(podReports):
    result = dict()

    for r in podReports.values():
        currList = result.get(r.getNode())
        if currList == None:
            currList = list()
        xs,ys = tuplesToLists(r.getConsumptions())
        currList.append((r.getName(),xs,ys))
        result.update({r.getNode() : currList})
    
    return result
            
        
        
    
    
def plotData(axis,data,xlabel='',ylabel='',title=''):
    max_xs = -1000000000
    min_xs = 1000000000
    max_ys = -1000000000
    min_ys = 1000000000
    for d in data:
        label = d[0]
        xs = d[1]
        ys = d[2]
        
        max_xs = max(max_xs,max(xs))
        min_xs = min(min_xs,min(xs))
        max_ys = max(max_ys,max(ys))
        min_ys = min(min_ys,min(ys))
        
        axis.plot(xs,ys,label=label,alpha=0.7)

    
   
    xSteps = 30
    ySteps = 15
    
    xs_step = roundAxisSteps((max_xs - min_xs)/xSteps)
    ys_step = roundAxisSteps((max_ys - min_ys)/ySteps)
    
    axis.set(xlabel=xlabel, ylabel=ylabel,title=title)
    axis.grid(which='both')
    axis.xaxis.set_ticks(np.arange(min_xs,max_xs+xs_step,xs_step))
    axis.yaxis.set_ticks(np.arange(min_ys,max_ys+3*ys_step,ys_step))
    
    box = axis.get_position()
    axis.set_position([box.x0, box.y0,box.width * 0.9, box.height])
    
    axis.legend(bbox_to_anchor=(1.00, 1.00),prop=FontProperties(size='small'))
    
    
def roundAxisSteps(stepValue):
    if stepValue < 1:
        return 1
    elif stepValue < 2:
        return 2
    elif stepValue < 5:
        return 5
    elif stepValue < 10:
        return 10
    elif stepValue < 25:
        return 25
    elif stepValue < 50:
        return 50
    elif stepValue < 100:
        return 100
    elif stepValue < 200:
        return 200
    elif stepValue < 250:
        return 250
    elif stepValue < 500:
        return 500
    
        
def plotPodReports(axis,reports):
    for r in reports.values():
        xs,ys = tuplesToLists(r.getConsumptions())
        axis.plot(xs,ys,label=r.getName())

plt.close()
mpl.use('WebAgg')

filePath = 'out.txt'
nodeLoads = formatDataToPlot(out.nodeCpuLoads(filePath))
nodeLoadsPerc = formatDataToPlot(out.nodeCpuLoadsPerc(filePath))
podReportsByNode = formatPodDataByNode(out.podReports(filePath))

rows = 6

fig,axs = plt.subplots(rows,1,figsize=(15,rows*6))

plotData(axs[0], nodeLoads,'Time Units','Millicores','Node Cpu Load')
plotData(axs[1], nodeLoadsPerc,'Time Units','Load %','Node Cpu Load %')
i = 2
for n in podReportsByNode.keys():
    plotData(axs[i], podReportsByNode.get(n),'Time Units','Millicores','Pods load by Node:' + n)
    i = i+1




#plt.plot()

plt.show()    
# Prepare the data
# x = np.linspace(0, 10, 100)

# # Plot the data
# plt.plot(x, x, label='linear')
# plt.plot()
# # Add a legend
# plt.legend()

# print()
# # Show the plot
# plt.show()