# -*- coding: utf-8 -*-
"""
Created on Wed May 12 14:08:52 2021

@author: Utente
"""
import csv_reader as cr
import df_manip as dfm
import sys


def readAndFormatCsvs(folder):
    df = cr.readCsvsDf(folder)
    df = dfm.dump2ColsIteration(df)
    df['value'] = df['value'].apply(lambda x:x*1000)
    
    return df


def printToTxt(dataframe, folder = '', name = 'calibrationAvg.txt'):
    file = open(folder + '\\' + name,'w+')
    file.write(str(dataframe) + '\n')
    file.close()


def countPodsPerIteration(df):
    df = df.groupby(['iteration','service'], as_index=False).agg(
    {
     'pod' : 'count'
     }
    )
    
    return df


def avgPodsConsByIteration(df):
    df = df.groupby(['iteration','pod','node'], as_index=False).agg(
    {
      'value': 'mean',
      'service': 'first'
      }
    )
    
    return df


def totalServiceByIteration(df):
    df = df.groupby(['service','iteration'], as_index=False).agg(
    {
      'value': 'sum'
      }
    )
    
    return df


def totalServiceCons(df):
    df = totalServiceByIteration(df)
    
    df = df.groupby(['service'], as_index=False).agg(
    {
      'value': 'mean'
      }
    )
    
    return df


def listPodsConfigs(df):
    return df.groupby('service')['pod'].apply(list)


def filterMdCfg1(dataf):
    df = countPodsPerIteration(dataf)
    
    incorrect = df[((df['service'] == 'adservice') & (df['pod'] != 4) |
              (df['service'] == 'cartservice') & (df['pod'] != 4) |
              (df['service'] == 'productcatalogservice') & (df['pod'] != 4) |
              (df['service'] == 'recommendationservice') & (df['pod'] != 4) |
              (df['service'] == 'redis-cart') & (df['pod'] != 4) |
              (df['service'] == 'currencyservice') & (df['pod'] != 8) |
              (df['service'] == 'frontend') & (df['pod'] != 8)) 
              ]
    
    incorrectIts = set(incorrect['iteration'])
    
    for v in incorrectIts:
        dataf = dataf[(dataf['iteration'] != v)]
    
    
    return dataf

def run(folder):
    df = readAndFormatCsvs(folder)
    df = avgPodsConsByIteration(df)
    df = filterMdCfg1(df)
    printToTxt(totalServiceCons(df),folder)

if __name__ == '__main__':
    # if (len(sys.argv) >= 2):
    #     folder = sys.argv[1]
    # else:
    #     raise Exception('Specify an input folder')
    
    folder = '..\\md\\calibration\\wf3\\200'
    
    df = readAndFormatCsvs(folder)
    df = avgPodsConsByIteration(df)
    df = filterMdCfg1(df)
    
    
    print(len(set(df['iteration'])),end='\n\n')
    print(totalServiceByIteration(df).sort_values(by=['iteration','service']),end='\n\n')
    print(totalServiceCons(df))




