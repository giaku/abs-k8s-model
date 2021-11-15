absc -e tests/fixed-nodes/scheduling-2A-2C/couples/$1.abs K8sMaster.abs K8sService.abs K8sUtil.abs K8sWorkflow.abs K8sClients.abs

./run.sh $1
