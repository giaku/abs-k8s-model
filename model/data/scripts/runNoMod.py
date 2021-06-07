# -*- coding: utf-8 -*-
"""
Created on Mon Jun  7 18:14:44 2021

@author: Utente
"""
import os
import mixedPlot as mxp
import sys
import traceback

def runAll():
    paths = ['..\\md\\mixed_wf_2nd_scheduling']
    for path in paths:
        for fld in os.listdir(path):
            try:
                mxp.run_NoMod(path + '\\' + fld)
            except:
                print('error running on: '  + path + '\\' + fld)
                
def runNew():
    paths = ['..\\md\\hpc4ai_data\\slices\\2nodes-vs-3nodes2021-06-06_09_53_41\\outputs2_2node']
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

if len(sys.argv) > 1:
    if sys.argv[1] == '-all' and len(sys.argv) == 2:
        runAll()
    else:
        raise Exception('invalid arguments')
else:
    runNew()