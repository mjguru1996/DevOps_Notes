# DevOps_Notes
Kubernetes:
It is a Container orchestration tool which is used to manage the containerized application by automated healing automated role back .

Components of Kubernetes:

Master Node:
1.API Server- It acts as an front end of the entire architecture communication

2.Kubectl-It is the tool which is used to communicate with the cluster

3.Controller Manager- It is connected only to API server . It Controles the entire pods creation and replicas

4.Scheduler-This schedules the pod activities like creation, deletion, deployment etc.,

5.etcd (distributed key=value database) - This stores all the details about the cluster.

Worker Node:
1. kubelet - this is the connecting/managing component from master to worker
   
2. kubeproxy - All the internet request for the applications will come via this only. This plays vital role for user to application connectivity.
   
3. POD - Grouped containers, functional unit inside this architecture
