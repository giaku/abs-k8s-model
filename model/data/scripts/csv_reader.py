# -*- coding: utf-8 -*-
"""
Created on Wed Apr 28 15:18:21 2021

@author: Utente
"""

import os
import statistics as stat
import pandas as p

def readCsv(filePath):
    """
    Takes a .csv file with a first line with headers and returns a dictionary containing the columns of the file
    as lists identified by the header of the column.
    
    ex: "a","b","c"
        x1, y1, z1
        x2, y2, z2
        ...
        xn, yn, zn
        
        =>
        
        { a : [x1,..,xn] , b : [y1,..,yn] , c : [z1,..,zn]}

    Parameters
    ----------
    filePath : str
        path of the csv file.

    Returns
    -------
    result : dict
        { header : values}
            header : str
            values : list.

    """
    result = dict()
    
    f = open(filePath)
    
    header = f.readline().replace('"','')
    headers = header.split(',')
    length = len(headers)
    for h in headers:
        result.update({h : list()})
        
    lists = list()
    for i in range(length):
        lists.append(list())
        
    lines = f.readlines()
    for l in lines:
        values = l.split(',')
        if (len(values) == len(headers)):
            for i in range(len(headers)):
                lists[i].append(values[i])
            
    for i in range(length):
        result.update({headers[i] : lists[i]})
        
    f.close()
        
    return result
 

def readCsvs(directory):
    """
    Generates a list of dictionaries using the readCsv method from the .csv files contained in the input directory

    Parameters
    ----------
    directory : str
        directory path.

    Returns
    -------
    result : list
        resulting list of dict.

    """
    result = list()
    #print(os.listdir(directory))
    
    for fileName in os.listdir(directory):
        if fileName.endswith('csv'):
            try:
                val = readCsv(directory + '\\' + fileName)
                result.append(val)
            except:
                pass            

    return result

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

       
def averageValues(csvDict):
    """
    Takes a dict obtained by a csv file and computes the average value for each column,
    doesn't consider not numeric values

    Parameters
    ----------
    csvDict : dict
        { label : [values] }.

    Returns
    -------
    result : dict
        { label : (average,standard deviation) }.

    """
    result = dict()
    
    for k in csvDict.keys():
        vals = csvDict.get(k)
        numeric = list()
        c = 0
        total = 0
        for v in vals:
            try:
                value = float(v)
                numeric.append(value)
                total += value
                c += 1
            except:
                pass
        if (c > 0):
            avg = total / c
        else:
            avg = 'none'
           
        stdev = 'none'
        if len(numeric) >= 2:
            stdev = stat.stdev(numeric)
            
        result.update({k : (avg,stdev,c)})
        
    return result


def mergeAvgs(avgs):
    """
    Takes a list of averages computed with averageValues() and computes the averages of all the contained values

    Parameters
    ----------
    avgs : list
        list of dicts produced by averageValues method.

    Returns
    -------
    result : dict
        averages of the input averages reports.

    """
    result = dict()
    
    for avg in avgs:
        for k in avg.keys():
            xs = avg.get(k)[0]
            rs = result.get(k)
            if rs == None:
                rs = list()
            rs.append(xs)
            result.update({ k : rs })
        
    return result


def directoryAvgs(directory):
    """
    Computes the average of the averges of the .csv files contained in the input folder

    Parameters
    ----------
    directory : str
        directory path.

    Returns
    -------
    result : dict
        resulting averages dict, produced by the mergeAvgs on the averages produced by the .csv files.

    """
    csvList =  readCsvs(directory)
    avgList = list()
    
    for d in csvList:
        d = averageValues(d)
        avgList.append(d)
        
    result = averageValues(mergeAvgs(avgList))
    
    return result
    


def outputAvg(avgs):
    """
    Generates the output for a csv file processed with readCsv

    Parameters
    ----------
    avgs : dict
        input dict generated by readCsv.

    Returns
    -------
    result : str
        output string.

    """
    result = ''
    
    for k in avgs.keys():
        label = k.strip('\n')
        avg = avgs.get(k)[0]
        stdev = avgs.get(k)[1]
        samples = avgs.get(k)[2]
        
        valid = False
    
        if isinstance(avg,float):
            avg = '{:.3f}'.format(avg)
            valid = True
        if isinstance(stdev,float):
            stdev = '{:.5f}'.format(stdev)
            valid = True
            
        if valid:
            result = result + '{0:<35} | avg: {1:>8} | stdev: {2:>10} | samples: {3:>4}\n'.format(label,str(avg),str(stdev),str(samples))
        
    return result








            