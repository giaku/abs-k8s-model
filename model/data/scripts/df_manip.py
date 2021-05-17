# -*- coding: utf-8 -*-
"""
Created on Fri May  7 17:09:50 2021

@author: Utente
"""
import numpy as np
import pandas as p

def filterDf(df,column,condition):
    """
    Generates a new DataFrame containing only the rows such that
    condition(df[column]) is True

    Parameters
    ----------
    df : DataFrame
        The input DataFrame.
    column : str
        Name of the column containing the value to check.
    condition : function
        condition(x):
            x - element of the df column
            returns: bool.

    Returns
    -------
    DataFrame
        a new DataFrame filtered from the rows s.t. condition(x) == False.

    """
    index = df.columns.get_loc(column)
    arr = df.to_numpy()
    res = list()
    
    for e in arr:
        if (condition(e[index])):
            res.append(list(e))
            
    return p.DataFrame(res,columns = df.columns)

def dFAsColumnsServices(dataframe):
    """
    Takes a DataFrame with services as columns and returns one with 
    two columns: service,value. Every row is a consumption value with the
    related service

    Parameters
    ----------
    dataframe : DataFrame
        input DataFrame.

    Returns
    -------
    DataFrame
        the resulting service,value DataFrame.

    """
    aux = dict()
    sList = list()
    vList = list()

    for c in dataframe.items():
        for val in c[1]:
            try:
                float(val)
                sList.append(c[0])
                vList.append(val)
            except:
                pass

    aux.update({'service':sList})
    aux.update({'value':vList})

    return p.DataFrame(aux)

def dataFrameAsColumns(dataframe):
    aux = dict()
    sList = list()
    vList = list()

    for c in dataframe.items():
        for val in c[1]:
            try:
                float(val)
                sList.append(c[0])
                vList.append(val)
            except:
                pass

    aux.update({'service':sList})
    aux.update({'value':vList})

    return p.DataFrame(aux)

def dump2Cols(dataframe):
    l = list()

    for c in dataframe.items():
        for val in c[1]:
            try:
                v = float(val)
                pod,service,node = getPodServiceNode(c[0])
                r = (v,pod,service,node)
                l.append(r)
            except:
                pass

    return p.DataFrame(l,columns=['value','pod','service','node'])


def dump2ColsIteration(dataframe):
    l = list()

    for c in dataframe.items():
        i = 0
        for val in c[1]:
            try:
                v = float(val)
                pod,service,node = getPodServiceNode(c[0])
                r = (v,pod,service,node,dataframe['iteration'][i])
                l.append(r)
            except:
                pass
            i = i + 1

    return p.DataFrame(l,columns=['value','pod','service','node','iteration'])


def getPodServiceNode(label):
    subls = label.split('_')
    pod = subls[0].split(':')[1]
    service = subls[1].split(':')[1]
    node = subls[2].split(':')[1]
    
    return (pod,service,node)

def mergeModel(test,model):
    """
    Takes two DataFrames, one from the model and one from the tests, and merge
    them into a single DataFrame.
    - drops the 'time-unit' column from MODEL
    - filters the rows with value == 0 from the MODEL
    - the rows of the resulting df will have a column named 'source'
      with two possible values: 'test' and 'model'
    - changes the 'value' column name into 'millicores', converts the 'value'
      values of the test df from cores to millicores (* 1000)

    Parameters
    ----------
    test : DataFrames
        tests dataframe.
    model : DataFrames
        model dataframe.

    Returns
    -------
    result : DataFrames
        resulting dataframe.

    """
    model = model.drop(columns=['time-unit'])
    model = model[(model['value'] != 0)]
    
    test['value'] = test['value'].apply(lambda x:x*1000)
    
    result = p.concat([test,model], keys=['test','model']).reset_index()
    
    result = result.drop(columns=['level_1'])
    result = result.rename(columns={'level_0':'source','value':'millicores'})
    
    return result
    
def mapNodes(df):
    df['node'] = df['node'].apply(mapNodeName)
    return df

def mapNodeName(node):
    if '1' in node:
        return 'Worker-1'
    elif '2' in node:
        return 'Worker-2'
    elif '3' in node:
        return 'Worker-3'
    elif '4' in node:
        return 'Worker-4'
    else:
        return 'Worker'


    
    