# -*- coding: utf-8 -*-
"""
Created on Wed May 19 09:38:13 2021

@author: Utente
"""
import os
import calibrationAvg as cavg

paths = ['..\\md\\calibration\\wf1','..\\md\\calibration\\wf2','..\\md\\calibration\\wf3']
for path in paths:
    for fld in os.listdir(path):
        cavg.run(path + '\\' + fld)