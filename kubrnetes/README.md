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

Basic commands
================
kubectl get nodes
