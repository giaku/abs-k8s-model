# -*- coding: utf-8 -*-
"""
Created on Fri May 14 10:52:24 2021

@author: Utente
"""
# import sys
import df_manip as dfm
# import dfPlots as dfp
# import pandas as pnd
import output_p as outp
import csv_reader as csvr
import seaborn as sns
from matplotlib import pyplot as plt


def readAndFormatCsvs(folder):
    df = csvr.readCsvsDf(folder)
    df = dfm.dump2ColsIteration(df)
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
    df = df.groupby(['service','source','iteration'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    g = sns.catplot(x="millicores", y="service", hue="source", kind="swarm",
                data=df, height=6, aspect=1.6, legend = False)
    g.set(xlabel='Average Load (Millicores)')
    g.ax.legend(loc='center left', bbox_to_anchor=(1, 0.5), title='source')

    plt.tight_layout()
    plt.savefig(folder + '\\serviceLoads.svg', format='svg')


def nodeLoads(df, folder):
    df = df.groupby(['source','node','iteration'], as_index=False).agg(
    {
     'millicores': 'sum',
     'source': 'first',
     }
    )
    
    g = sns.catplot(x="millicores", y="node", hue="source", kind="swarm",
                data=df, height=6, aspect=1.6)
    g.set(xlabel='Average Load (Millicores)', xlim=[0,4000])
    g.ax.legend(loc='center left', bbox_to_anchor=(1, 0.5))

    plt.tight_layout()
    plt.savefig(folder + '\\nodeLoads.svg', format='svg')


def genDf(folder):
    model = outp.PodReport.prListToDf(outp.podReports(folder + '\\model.txt'))
    model['iteration'] = -1

    test = readAndFormatCsvs(folder + '\\csvs')
    
    res = dfm.mergeModel(test, model)
    res = dfm.mapNodes(res)
    res = podAvgConsumptions(res)
    
    return res


# if (len(sys.argv) >= 2):
#     folder = sys.argv[1]
# else:
#     raise Exception('Specify an input folder')
   
folder = '..\\md\\mixed_wf\\wf1-100_wf3-200'
    
df = genDf(folder)

servicesConsumption(df, folder)
nodeLoads(df, folder)







