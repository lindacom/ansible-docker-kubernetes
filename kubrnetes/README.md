Kubernetes overview
=========================
Kubernetes is an open source platformed designed to automate deploying scaling and operation application containers.

Containers - a collection of software processes unified by one namespace with access to an operating system kernal
that it shares with other containers running on a single host.

Run containers in clusters on virtual machines. You can use Docker (or other) contaiers to develop and build
appliations and then use Kubernetes to run these applications.

Kubernetes architecture
===============================
Master node - responsible for overall management of the Kubernetes cluster. It has three components - api server, 
scheduler and controller manager. etcd is distributed key value store. You interact with the masternode using
kubectl.

Worker node - communicates with master node using kubelet.

Kubernetes components
====================
N.b. every component is replicated and load balanced across nodes.

1. Node and pod - Pod is an extraction of a container. A pod usually runs one appliation per pod.  Pod had it's IP (virtual)
address which it uses to communicate. Nb. if it restarts/gets recreated it gets a new IP.  

Worker node has three processes neeed to run every node - container runtime, kubelet - interacts with both the container and node.
Kuelet starts the pod with a container inside db service, kube proxy forwards the requests.

Master nodes - managing processes re done by master nodes.  There are four processes that un on every master node to control cluster state 
and workr nodes. Api server - the client interacts with this cluster gateway acts as a gatekeeer for authentication, scheduler - decides
which node a pod goes to and kubelet executes the request, controller manager - detects cluster state changes of crashed pod makes a request
to scheduler then sent to kubelet to execute. etcd - key value store of cluster state so that the processes know what has changed

2. Service - permanent ip address can be attached to each pod i.e. app has a service and database has a service. 
external service opens communication for external services N.b. the domain name is not standard therefore ingress is used
internal service e.g. used for database

3. Ingress - handles every incoming request. does forwarding to service. It is replicated on each node. Ingress and service are both
load balancers. The service forwards request to database service. 

4. Configmap and secrets - configmap contains configuration for app e.g. url of database.secrets - same as configmap but used to store secret data e.g. 
database username and password in base64 encoded format.  connect configmap and secrets to pod so data is accessible.

5. volumes - attaches physical storage (from local machine, rmote or cloud) to the pod.

6. Deployment and statefulset - Deployment manages a replica set which manages a pod which is an abstraction of a containter. 

statefulset is for stateful apps eg. elasticsearch or databases. deployment is an abstraction on top of pods
app is replicated to other nodes which is also connecte to the service. Service is a load balancer- forwards request to whichever node is less busy.  
The deployment specifies how many replicas. 

N.b databases can't be replicated using deployment because it has state (data) statefulset is used instead.

Install Kubectl
===================
See https://kubernetes.io/tasks/tools/install-kubectl. Add the Kubectl folder in environment variables.

N.b. alternatively in virtualbox install minikube.

Run a kubernetes app
====================
To start minikube enter minikube start
run kubectl get nodes
enter kubectl get all to find out what's in your cluster This returns all resources
To run an application called hello world you need to create a resource - enter kubctl create -f helloworld.yaml
run kubectl get all - a pod, a deployment and a replicaset are now added to the service
To access the app you need to create a service construct for kubernetes - run kubectl expose deployment helloworld --type=NodePort
Then run kubectl get all

You now have two services - service/kubernetes and service/helloworld

enter minikube service helloworld - you are then taken to the web browser on ip and port

N.b. the container id displayed relates to the pod in the service list.

Examine the app
==============
enter kubectl get deployment then run kubectl get deployment/helloworld -o yaml to output as yaml

N.b. you will see the yaml of the live deployment

enter kubectl get service then enter kubectl get service /helloworld -o yaml

Troubleshooting
====================
To see logs enter kubectl get deployments then enter kubectl get pods and copy pod name (without the leading kubectl)
then enter kubectl logs <podname>

Extc into the pod to run commands in the pod - enter extc -it <podname> /bin/bash
then enter ps -ef to see the processes
enter exit

N.b if there are several containers enter -c <name>after the podname
  
If the whole cluster (including etcd) goes down you can use etcd snapshots in remote storage for disaster recovery.  
  
For new master node - get new server, install all master/worker node processes, add it to the cluster.

Basic commands
================
kubectl get nodes - lists name, status and role
kubectl get pod
kubectl get services
kubectl get replicaset - replicaset manages replication of pod
kuectl edit deployment <name>
kubectl logs <podname>
kubectl describepod
kubectl exec -it <podname> --bin/bash
kubectl delete deployment <name>
kubctl get pod -o wide - shows more information including ip address of the pod
