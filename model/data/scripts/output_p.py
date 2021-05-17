# -*- coding: utf-8 -*-
"""
Created on Sat Mar 27 12:49:56 2021

@author: Utente
"""
import pandas as pnd

def nodeCpuLoads(filePath):
    """
    Returns a dictionary in the form of : {nodeName : nodeCpuLoad}
    
    nodeName : str
    nodeCpuLoad : list of (tu,cpuLoad) 
        tu : int
        cpuLoad : int

    Parameters
    ----------
    filePath : str
        Path of the file to read the model output.

    Returns
    -------
    node_cap : dict
        Resulting dictionary containing the node cpu loads.

    """
    file = open(filePath)

    node_loads = dict()

    lines = file.readlines()

    for line in lines:
        if line.startswith("TYPE"):
            elems = line.split(' ')
        
            for i in range(len(elems)):
                elems[i] = elems[i].split(':')
            
            # node_cpuLoad
            if elems[0][1] == "node_cpuLoad":
                entry = (elems[2][1],(int(getTimeUnit(elems[1][1])),int(elems[3][1]))) # (NODE,(TU,VALUE))
                v = node_loads.get(entry[0],[])
                v.append(entry[1])
                node_loads.update({entry[0] : v})

    file.close()    

    return node_loads

def nodeCpuLoadsPerc(filePath):
    """
    Returns a dictionary in the form of : {nodeName : nodeCpuLoadPerc}
    
    nodeName : str
    nodeCpuLoadPerc : list of (timeUnit,cpuLoadPerc) 
        timeUnit : int
        cpuLoadPerc : int

    Parameters
    ----------
    filePath : str
        Path of the file to read the model output.

    Returns
    -------
    node_cap : dict
        Resulting dictionary containing the node cpu load %.

    """
    file = open(filePath)

    node_loads = dict()
    node_caps = nodeCpuCapacities(filePath)

    lines = file.readlines()

    for line in lines:
        if line.startswith("TYPE"):
            elems = line.split(' ')
        
            for i in range(len(elems)):
                elems[i] = elems[i].split(':')
            
            # node_cpuLoad
            if elems[0][1] == "node_cpuLoad":
                nodeName = elems[2][1]
                timeUnit = int(getTimeUnit(elems[1][1]))
                cpuConsPerc = int(elems[3][1])/node_caps.get(nodeName)*100
                entry = (nodeName,(timeUnit,cpuConsPerc)) # (NODE,(TU,VALUE))
                v = node_loads.get(entry[0],[])
                v.append(entry[1])
                node_loads.update({entry[0] : v})

    file.close()    

    return node_loads

def nodeCpuCapacities(filePath):
    """
    Returns a dictionary in the form of : {nodeName : nodeCapacity}
    
    nodeName : str
    nodeCapacity : int

    Parameters
    ----------
    filePath : str
        Path of the file to read the model output.

    Returns
    -------
    node_cap : dict
        Resulting dictionary containing the node capacities.

    """
    file = open(filePath)

    node_cap = dict()

    lines = file.readlines()

    for line in lines:
        if line.startswith("TYPE"):
            elems = line.split(' ')
        
            for i in range(len(elems)):
                elems[i] = elems[i].split(':')
            
            # node_cpuLoad
            if elems[0][1] == "node_creation":
                node_cap.update({elems[2][1] : int(elems[3][1])})

    file.close()    

    return node_cap

def podReports(filePath):
    """
    Returns a dictionary in the form of : {podName : podReport}
    
    podName : str
    podReport : PodReport

    Parameters
    ----------
    filePath : str
        Path of the file to read the model output.

    Returns
    -------
    podReports : dict
        Resulting dictionary containing all the pods reports.

    """
    file = open(filePath)

    podReports = dict()

    lines = file.readlines()

    for line in lines:
        if line.startswith("TYPE"):
            elems = line.split(' ')
        
            for i in range(len(elems)):
                elems[i] = elems[i].split(':')
            
            # node_cpuLoad
            if elems[0][1] == "pod_cpuLoad":
                podName = elems[2][1] + '-' + elems[4][1]
                service = elems[2][1]
                node = elems[3][1]
                timeUnit = int(getTimeUnit(elems[1][1]))
                cpuConsumption = int(elems[5][1])
                
                if podReports.get(podName) != None:
                    report = podReports.get(podName)
                    report.consumptions.append((timeUnit,cpuConsumption))
                else:
                    report = PodReport(podName, service, node, list())
                    report.consumptions.append((timeUnit,cpuConsumption))
                podReports.update({podName : report})

    file.close()    

    return podReports

def getTimeUnit(timeString):
    """
    Isolates the numeric part of the time unit value.
    "Time(x)" -> "x"
    
    Parameters
    ----------
    timeString : String
        input time unit string.
        
    Returns
    -------
    result : String
        result.

    """
    result = str()
    for c in timeString:
        if str(c).isdigit():
           result = result + c 
    return result

def sumConsuptions(l1,l2):
    """
    Takes two lists of consumptions (TU,value) and returns a single list summing
    up all the consumptions having the same TU in a single pair.

    Parameters
    ----------
    l1 : list
        list of pairs (TU,consumption).
    l2 : list
        list of pairs (TU,consumption).

    Returns
    -------
    result : list
        list of pairs (TU,consumption).

    """
    result = list()
    aux = dict()
    
    ls = l1 + l2
    for c in ls:
        if aux.get(c[0]) != None:
                    cons = aux.get(c[0])
                    cons = cons + c[1]
        else:
            cons = c[1]
        aux.update({c[0] : cons})
            
    for e in aux.keys():
        result.append((e,aux.get(e)))
        
    return result
        

class PodReport:
    """
    Report of pod consumptions during a simulation:
        pod: str - name of the pod, 'service'-'id'
        service: str - service of the pod
        node: str - node on which the pod is deployed
        consumptions: list - list of pairs (timeUnit : int,cpuConsumption : int)
    """
    def __init__(self,pod,service,node,consumptions):
        self.pod = pod
        self.service = service
        self.node = node
        self.consumptions = consumptions.copy()
        
    def getName(self):
        return self.pod    
    def getService(self):
        return self.service
    def getNode(self):
        return self.node
    def getConsumptions(self):
        return self.consumptions.copy()
    
    def toDf(self):
        """
        Generates a DataFrame with 'time-unit','value','pod','service','node'.
        'value' is the cpu consumption.

        Returns
        -------
        DataFrame
            .

        """
        l = list()
        
        for c in self.consumptions:
            t = (c[0],c[1],self.pod,self.service,self.node)
            l.append(t)
            
        return pnd.DataFrame(l,columns=['time-unit','value','pod','service','node'])
        
    def prListToDf(podReports):
        if isinstance(podReports, dict):
            podReports = list(podReports.values())
        
        l = list()
        
        for pr in podReports:
            for c in pr.getConsumptions():
                t = (c[0],c[1],pr.getName(),pr.getService(),pr.getNode())
                l.append(t)
                
        return pnd.DataFrame(l,columns=['time-unit','value','pod','service','node'])
      
class ServiceReport:
    """
    Report of service consumptions during a simulation:
        name: str - service name
        consumptions: dict - {node : consumptionsList}
            node: str - node which resources are consumed
            consumptionsList: list - list of pairs (timeUnit : int,cpuConsumption : int)
    """
    def __init__(self,name,consumptions):
        self.name = name
        self.consumptions = consumptions.copy()
        
    def getName(self):
        return self.name   
    
    def getConsumptions(self):
        return self.consumptions.copy()
    
    def setConsumptions(self,consumptions):
        self.consumptions = consumptions.copy()

    def createFromPodReports(podReports):
        """
        Generates a dict { service : serviceReport} from a list of PodReport

        Parameters
        ----------
        podReports : list
            input list of PodReport.

        Returns
        -------
        result : dict
            resulting dict of ServiceReport.

        """
        result = dict()
        
        for p in podReports:
            service = p.getService()
            node = p.getNode()
            podConsumptions = p.getConsumptions()
            sReport = result.get(service)
            if sReport == None:
                sCons = dict({node : podConsumptions})
                sReport = ServiceReport(service, sCons)                
            else:
                sCons = sReport.getConsumptions()
                nCons = sCons.get(node)
                if nCons == None:
                    nCons = podConsumptions
                else:
                    nCons = sumConsuptions(nCons, podConsumptions)
                sCons.update({node : nCons})
                sReport.setConsumptions(sCons)            
            result.update({service : sReport})
            
        return result
        





