# -*- coding: utf-8 -*-
"""
Created on Wed May 19 18:42:18 2021

@author: Utente
"""
import os
import mixedPlot as mxp

paths = ['..\\md\\mixed_wf']
for path in paths:
    for fld in os.listdir(path):
        try:
            mxp.run(path + '\\' + fld)
        except:
            print('error running on: '  + path + '\\' + fld)