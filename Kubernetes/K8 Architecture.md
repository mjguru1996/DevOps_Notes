# Kubernetes # 
K8 is a container orchestration tool in which we can manage all containers by creating pods. Its has some advanced features over docker like 
1. Auto healing
2. Auto Scaling
3. Enterpreise level support
4. Automated roleback  

# Compenents of Control Node #
**Contol Plane or Control Node**
1. **API Server**- It acts as a Front end of the entire architecture where all the requests comes into the cluster via **API server** only .It exposes the K8 to the external world.
2. **Scheduler** -It is responsible for scheduling your pods or resources in Kubernetes.
3. **etcd** -Basically a Key Value store which stores the cluster level information.
4. **Contoler manager** - Ensure that the all controllers like replica sets are running.
5. **Cloud Contoller Managers** -The cloud controller manager lets you link your cluster into your cloud provider's API.

**Worker Node**
In Worker node there are maily 3 components:
1. **Kubelet** - Its Basically responsibel for creation of pods. It will moitor the pods wheater its running or not. If its not running it will take necessary action to run the pods   
2. PODS - Its basically a group of container.
3. Kube proxy -Responsible for Networking the containers like IP address and Load balancing concept. Genenrally it uses IP table on Linux Machine.
4. Container Runtime - Its responsible for running an container.



