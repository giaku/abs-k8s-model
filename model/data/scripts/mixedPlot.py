# -*- coding: utf-8 -*-
"""
Created on Fri May 14 10:52:24 2021

@author: Utente
"""
import sys
import df_manip as dfm
# import dfPlots as dfp
# import pandas as pnd
import output_p as outp
import csv_reader as csvr
import seaborn as sns
import matplotlib as mpl
from matplotlib import pyplot as plt


def readAndFormatCsvs(folder):
    df = csvr.readCsvsDf(folder)
    df = dfm.dump2ColsIteration(df)
    #df['value'] = df['value'].apply(lambda x:x*1000)
    
    return df

def readAndFormatCsvsWithTime(folder):
    df = csvr.readCsvsDf(folder)
    df = dfm.dump2ColsIterationWithTime(df)
    #df['value'] = df['value'].apply(lambda x:x*1000)
    
    return df


def plotDf(df, folder):
    g = sns.catplot(x="millicores", y="service", hue="source", kind="swarm",
                data=df, height=6, aspect=1)
    g.set(xlabel='Average Load (Millicores)')

    plt.tight_layout()
    plt.savefig(folder + '\\serviceLoads.svg', format='svg')


def podAvgConsumptions(df):
    df = df.groupby(['pod','node','iteration'], as_index=False).agg(
    {
      'millicores': 'mean',
      'source': 'first',
      'service': 'first'
      }
    )
    
    return df


def servicesConsumption(df, folder):
    df = df.groupby(['service','iteration'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    fig = plt.figure(figsize=(9.6,6))
    ax = plt.axes()
    fig.add_axes(ax)
    g = sns.swarmplot(x="millicores", y="service", ax=ax,
                data=df)
    g.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    g.grid(True,axis='x')
    g.set(xlabel='Average Load (Millicores)', ylabel='Service')

    plt.tight_layout()
    plt.savefig(folder + '\\serviceLoads.svg', format='svg')

def servicesConsumption2(df, folder):
    df = df.groupby(['service','source','iteration'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    fig = plt.figure(figsize=(9.6,6))
    ax = plt.axes()
    fig.add_axes(ax)
    g = sns.swarmplot(x="millicores", y="service", hue="source", ax=ax,
                data=df)
    g.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    g.grid(True,axis='x')
    g.set(xlabel='Average Load (Millicores)', ylabel='Service')

    plt.tight_layout()
    plt.savefig(folder + '\\serviceLoads.svg', format='svg')
    
def servicesConsumptionTime(df, folder):
    df = df.groupby(['time','service'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    fig = plt.figure(figsize=(9.6,6))
    ax = plt.axes()
    ax.tick_params(axis='x', rotation=90)
    fig.add_axes(ax)
    g = sns.lineplot(x="time", y="millicores",
             hue="service", data=df)
    g.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    g.grid(True,axis='x')
    g.set(xlabel='Average Load (Millicores)', ylabel='Service')

    plt.tight_layout()
    plt.savefig(folder + '\\serviceLoads.svg', format='svg')
    
def servicesConsumptionTime2(df, folder):
    df = df.groupby(['time','service','node'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    multipleLineplotsOverColValue(df,'node',folder)
    g.savefig(folder + '\\multiPlot.svg', format='svg')

def nodeLoads(df, folder):
    df = df.groupby(['node','iteration'], as_index=False).agg(
    {
     'millicores': 'sum',
     'source': 'first',
     }
    )
    
    fig = plt.figure(figsize=(9.6,6))
    ax = plt.axes()
    ax.set(xlim=[0,4000])
    fig.add_axes(ax)
    g = sns.swarmplot(x="millicores", y="node", ax=ax,
                data=df)
    g.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    g.grid(True,axis='x')
    g.set(xlabel='Average Load (Millicores)', ylabel='Node')

    plt.tight_layout()
    plt.savefig(folder + '\\nodeLoads.svg', format='svg')

def nodeLoads2(df, folder):
    df = df.groupby(['source','node','iteration'], as_index=False).agg(
    {
     'millicores': 'sum',
     'source': 'first',
     }
    )
    
    fig = plt.figure(figsize=(9.6,6))
    ax = plt.axes()
    ax.set(xlim=[0,4000])
    fig.add_axes(ax)
    g = sns.swarmplot(x="millicores", y="node", hue="source", ax=ax,
                data=df)
    g.legend(loc='center left', bbox_to_anchor=(1, 0.5))
    g.grid(True,axis='x')
    g.set(xlabel='Average Load (Millicores)', ylabel='Node')

    plt.tight_layout()
    plt.savefig(folder + '\\nodeLoads.svg', format='svg')
    
def multipleLineplotsOverColValue(df, col_name, folder):
    
    sns.set_style("whitegrid")
    g = sns.FacetGrid(df, row="node", hue='service', height=4, aspect=4)
    g.map(sns.lineplot, "time", "millicores")        
    g.set_axis_labels('Time','Load [Millicores]')
    g.set_xticklabels(rotation=90)
    g.add_legend()

    g.tight_layout()
    return g


def nodeLoadsTime(df, folder):
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
    plt.savefig(folder + '\\nodeLoads.svg', format='svg')

def genDf(folder):
    model = outp.PodReport.prListToDf(outp.podReports(folder + '\\model.txt'))
    model['iteration'] = -1

    test = readAndFormatCsvs(folder)
    
    res = dfm.mergeModel(test, model)
    res = dfm.mapNodes(res)
    res = podAvgConsumptions(res)
    
    return res

def genDfNoModel(folder):
    test = readAndFormatCsvs(folder)
    
    res = dfm.mergeDfs(None, test)
    res = dfm.mapNodes(res)
    res = podAvgConsumptions(res)
    
    return res

def genDfNoModelWithTime(folder):
    test = readAndFormatCsvsWithTime(folder)
    
    res = dfm.mergeDfs(None, test)
    res = dfm.mapNodes(res)
    #res = podAvgConsumptions(res)
    
    return res

def run(folder):
    mpl.use('WebAgg')
        
    df = genDf(folder)
    
    nodeLoads2(df, folder)
    servicesConsumption2(df, folder)
    
def run_noMod(folder):
    mpl.use('WebAgg')
        
    df = genDfNoModel(folder)
    
    nodeLoads(df, folder)
    servicesConsumption(df, folder)
    
def run_plotTest(folder):
    mpl.use('WebAgg')
        
    df = genDfNoModelWithTime(folder)
    
    nodeLoadsTime(df, folder)
    servicesConsumptionTime2(df, folder)

if __name__ == '__main__':
    if (len(sys.argv) >= 2):
        folder = sys.argv[1]
    else:
        raise Exception('Specify an input folder')
    mpl.use('WebAgg')
        
    df = genDf(folder)
    
    nodeLoads2(df, folder)
    servicesConsumption2(df, folder)









