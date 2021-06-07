# -*- coding: utf-8 -*-
"""
Created on Mon Jun  7 18:14:44 2021

@author: Utente
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

if len(sys.argv) > 2:
    if sys.argv[1] == '-all' and len(sys.argv) == 3:
        runAll([sys.argv[2]])
    else:
        raise Exception('invalid arguments')
elif len(sys.argv) == 2:
    runNew([sys.argv[1]])
else:
    raise Exception('Specify a folder path')