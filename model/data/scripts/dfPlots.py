# -*- coding: utf-8 -*-
"""
Created on Mon May 10 11:07:09 2021

@author: Utente
"""
import csv_reader as csvr
import df_manip as dfm
import output_p as outp
import pandas as pnd
import seaborn as sns
from matplotlib import pyplot as plt

def nodeLoads(df):
    df = df.groupby(['source','node'], as_index=False).agg(
    {
     'millicores': 'sum',
     'source': 'first',
     }
    )
    
    sns.catplot(x="millicores", y="node", hue="source", kind="swarm", data=df)

def podAvgConsumptions(df):
    df = df.groupby(['pod','node'], as_index=False).agg(
    {
      'millicores': 'mean',
      'source': 'first',
      'service': 'first'
      }
    )
    
    return df


def ServicesConsumptionByNode(df):
    df = df.groupby(['service','node','source'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    return df


def ServicesConsumption(df):
    df = df.groupby(['service','source'], as_index=False).agg(
    {
      'millicores': 'sum',
      }
    )
    
    return df


def plotExample():
    example = pnd.DataFrame([
        ('Worker-1',2035,'test'),
        ('Worker-1',2130,'test'),
        ('Worker-1',2000,'test'),
        ('Worker-1',2200,'test'),
        ('Worker-1',2156,'test'),
        ('Worker-2',2010,'test'),
        ('Worker-2',1997,'test'),
        ('Worker-2',1980,'test'),
        ('Worker-2',2100,'test'),
        ('Worker-2',2034,'test'),
        ('Worker-3',1980,'test'),
        ('Worker-3',2130,'test'),
        ('Worker-3',2000,'test'),
        ('Worker-3',2200,'test'),
        ('Worker-3',2156,'test'),
        ('Worker-4',2035,'test'),
        ('Worker-4',2130,'test'),
        ('Worker-4',2000,'test'),
        ('Worker-4',2200,'test'),
        ('Worker-4',2156,'test'),
        ('Worker-1',2080,'model'),
        ('Worker-2',2080,'model'),
        ('Worker-3',2080,'model'),
        ('Worker-4',2080,'model'),
        ], columns=['node','millicores','source'])

    g = sns.catplot(x="millicores", y="node", hue="source", kind="swarm",
                data=example, height=8, aspect=1)
    g.set(xlabel='Average Load (Millicores)')

    plt.savefig('test.svg', format='svg')


def plotDf(df):
    g = sns.catplot(x="millicores", y="node", hue="source", kind="swarm",
                data=df, height=8, aspect=1)
    g.set(xlabel='Average Load (Millicores)')

    plt.savefig('test.svg', format='svg')


def genDf(folder):
    model = outp.PodReport.prListToDf(outp.podReports(folder + '\\model.txt'))

    test = pnd.DataFrame(csvr.readCsvs(folder + '\\csvs\\'))
    test = dfm.dump2Cols(test)
    
    res = dfm.mergeModel(test, model)
    res = dfm.mapNodes(res)
    res = podAvgConsumptions(res)
    res = ServicesConsumption(res)
    
    return res



# res = dfm.filterDf(res, 'node', lambda x:x == 'Node-1')
# res = res.groupby('service', as_index=False).agg({"millicores": "mean"})

#nodeLoads(res)

# res = res.groupby(['pod','node'], as_index=False).agg(
#     {
#      'millicores': 'mean',
#      'source': 'first',
#      'service': 'first'
#      }
#     )

