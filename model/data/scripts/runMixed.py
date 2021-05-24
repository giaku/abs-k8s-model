# -*- coding: utf-8 -*-
"""
Created on Wed May 19 18:42:18 2021

@author: Utente
"""
import os
import mixedPlot as mxp
import sys

def runAll():
    paths = ['..\\md\\mixed_wf']
    for path in paths:
        for fld in os.listdir(path):
            try:
                mxp.run(path + '\\' + fld)
            except:
                print('error running on: '  + path + '\\' + fld)
                
def runNew():
    paths = ['..\\md\\mixed_wf']
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
                        mxp.run(pth)
                        executed = executed + pth + '\n'
                    except:
                        print('error running on: '  + path + '\\' + fld)
            except:
                pass
    
    print('Executed: \n' + executed)

if len(sys.argv) > 1:
    if sys.argv[1] == '-all' and len(sys.argv) == 2:
        runAll()
    else:
        raise Exception('invalid arguments')
else:
    runNew()
    

