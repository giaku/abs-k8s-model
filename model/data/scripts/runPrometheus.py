# -*- coding: utf-8 -*-
"""
Created on Sun Oct 17 18:21:47 2021

@author: Andrews-mobile
"""

import os
import mixedPlot as mxp
import sys
import traceback
import matplotlib as mpl
import csv_reader as csvr
import pandas

def execute(folder):
    mpl.use('WebAgg')
    
    for fileName in os.listdir(folder):
        if fileName.endswith('csv'):
            try:
                v = csvr.readCsv(folder + '\\' + fileName)
                df = pandas.DataFrame(v)
                fname = fileName.split('.')[0]
            except:
                pass
            
            fig = nodeLoadsTime(df)
            
        
    df = mxp.genDfNoModelWithTime(folder)
    
    mxp.nodeLoads(df, folder)
    mxp.servicesConsumption(df, folder)

def runAll(paths):
    executed = ''
    for path in paths:
        for fld in os.listdir(path):
            try:
                pth = path + '\\' + fld
                mxp.run_noMod(pth)
                executed = executed + pth + '\n'
            except:
                print('error running on: '  + pth)
                traceback.print_exc()
                
    print('Executed: \n' + executed)
    
def readCsvsDf(directory):
    """
    Generates a DataFrame .csv files contained in the input directory

    Parameters
    ----------
    directory : str
        directory path.

    Returns
    -------
    result : DataFrame.

    """
    l = list()
    #print(os.listdir(directory))
    
    for fileName in os.listdir(directory):
        if fileName.endswith('csv'):
            try:
                val = readCsv(directory + '\\' + fileName)
                l.append(val)
            except:
                pass

    ldf = list()
    for d in l:
        ldf.append(p.DataFrame(d))
        
    result = p.concat(ldf, keys=range(len(ldf))).reset_index()
    
    result = result.drop(columns=['level_1'])
    result = result.rename(columns={'level_0':'iteration'})       

    return result

def multipleLineplotsOverColValue(df, col_name, folder):
    
    sns.set_style("whitegrid")
    g = sns.FacetGrid(df, row="node", hue='service', height=4, aspect=4)
    g.map(sns.lineplot, "time", "millicores")        
    g.set_axis_labels('Time','Load [Millicores]')
    g.set_xticklabels(rotation=90)
    g.add_legend()

    g.tight_layout()
    return g


def nodeLoadsTime(df):
    df = df.groupby(['time','node','iteration'], as_index=False).agg(
    {
     'millicores': 'sum',
     'source': 'first',
     }
    )
    
    fig = plt.figure(figsize=(9.6,6))
    ax = plt.axes()
    ax.tick_params(axis='x', rotation=90)
    #ax.set(xlim=[0,4000])
    fig.add_axes(ax)
    g = sns.lineplot(x="time", y="millicores",
             hue="node", data=df)
    g.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    g.grid(True,axis='x')
    g.set(xlabel='Time', ylabel='Load [Millicores]')

    plt.tight_layout()
    return plt