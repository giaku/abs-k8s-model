# -*- coding: utf-8 -*-
"""
Created on Wed May 19 09:38:13 2021

@author: Utente
"""
import os
import calibrationAvg as cavg

path = '..\\md\\calibration\\wf2'
for fld in os.listdir(path):
    cavg.run(path + '\\' + fld)