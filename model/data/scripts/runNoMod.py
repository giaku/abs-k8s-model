# -*- coding: utf-8 -*-
"""
Created on Mon Jun  7 18:14:44 2021

@author: borg-a

Processes all the folders inside the given folder. Takes the .csv files (iterations) and creates
two plots:
    - average load per node [millicores]
    - average load per service [millicores]
    
Help:
    python runNoMod.py <options> <path> 
        run through all the directories inside of the given path and process the .csv if possible and
        plots are not already in the folder.
            
    Options:
        -all : reprocess also folders with plots already created.
            
"""
import os
import mixedPlot as mxp
import sys
import traceback

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
                
def runNew(paths):
    executed = ''
    for path in paths:
        for fld in os.listdir(path):
            try:
                pth = path + '\\' + fld
                files = os.listdir(pth)
                svg = False
                for f in files:
                    if f.endswith('.svg'):
                        svg = True
                if not svg:
                    try:
                        mxp.run_noMod(pth)
                        executed = executed + pth + '\n'
                    except Exception:
                        print('error running on: '  + path + '\\' + fld)
                        traceback.print_exc()
            except:
                pass
    
    print('Executed: \n' + executed)
    
def runSingleFolder(path):
    executed = ''

    try:
        mxp.run_noMod(path)
        executed = executed + path + '\n'
    except:
        print('error running on: '  + path)
        traceback.print_exc()
                
    print('Executed: \n' + executed)
    
def runSingleFolderTime(path):
    executed = ''

    try:
        mxp.run_plotTest(path)
        executed = executed + path + '\n'
    except:
        print('error running on: '  + path)
        traceback.print_exc()
                
    print('Executed: \n' + executed)

if len(sys.argv) > 2:
    if sys.argv[1] == '-all' and len(sys.argv) == 3:
        runAll([sys.argv[2]])
    elif sys.argv[1] == '-single' and len(sys.argv) == 3:
        runSingleFolderTime(sys.argv[2])
    else:
        raise Exception('invalid arguments')
elif len(sys.argv) == 2:
    runNew([sys.argv[1]])
else:
    raise Exception('Specify a folder path')