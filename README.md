# A Kubernetes model in Real Time ABS
The repository contains a model of Kubernetes in Real Time ABS (Abstract Behavioural Specification) language that can be configured to different client workloads and to different microservices running in parallel and affecting each others performance. By means of simulations, system administrators can easily compare how different parameter configurations affect the performance of their deployed microservices at the modeling level.

# Run, edit and create a simulation

The 'experiments' folder contains the runnable simulations that have been used to initially validate the model, they implement the stress tests which have been run on the real cluster.

In the following it is shown how to create a basic simulation from scratch to model a toy example.

Create a simulation-name.abs file and import the model modules:

    import * from K8sService;
    import * from K8sMaster;
    import * from K8sUtil;

The following code goes in the main block of a simulation. First, in order to create a cluster, we need a cloud provider instance to be passed to the master node. The master node constructor takes two further parameters normally set to 1, the first defines how many time intervals must be taken into account to measure the average load of the worker nodes, the second how many time intervals should pass before a node is refilled with available cpu. I.e. the cpu is available at time intervals.
  
    CloudProvider cp = new CloudProvider(name);
    Master master = new MasterObject(cp,loadPeriod,refCycle);
  
Second we create as many worker nodes we need to reproduce our cluster infrastructure. The master's method can be called more than once to create different types of worker nodes
    
    Fut<Bool> fb = master!createNodes(numberOfNodes,cpu,memory);
    
Now we need to deploy our service, we start with its configuration, scalerCyclePeriod defines the frequency of the scheduler checks, i.e. how many intervals it should wait to check on the workload of the nodes, by default is 1.
In the pod configuration monitorCyclePeriod and compUnitSize normally are set to 1, they repesctively control how often (in time intervals) the monitor refreshes the available cpu in the pod and how much cpu a pod consumes when it is scheduled to execute.

    ServiceConfig sConfig1 = ServiceConfig(name, numberOfPods, minPods, maxPods, scalerCyclePeriod, upscaleThreshold, downscaleThreshold, downscalePeriod);
    PodConfig pConfig1 = PodConfig(compUnitSize, monitorCyclePeriod, insufficientMemoryCooldown, cpuRequest, cpuLimit);

    Service service1 = new ServiceObject(sConfig1, pConfig1);
    
The deploy of the service is simply:
  
    Fut<Bool> fb = master!deployService(service1);
    
    Fut<ServiceEndpoint> service1EP = service1!getServiceEndpoint();
    
 To generate a useful output, we still need to set up the status printer
  
    Printer printer = new PrinterObject();
    
    List<Service> sList = list[service1]; // list of the printed services

    printer!printStatus(master,sList,numberOfStatusPrints,statusPrintsPeriod); 
                                                                               
    
 Finally, we can create a request and invoke the service, the deadline parameter can be used to check whether the response time have met a certain expectation, but does not affect the execution of the simulation.
  
    Request req1 = Request(typeName, cpuCost, memoryCost);
    
    Fut<Bool> success = service1EP!invokeService(req1,deadline); // deadline example: Duration(5)



# More about the model

If you are not familiar with Real Time ABS, Kubernetes or both the reference to the article explaining the model and showing how precise can be will be added soon. It will give an introduction to the concepts metioned, and reference to complete guides in turn.

