Install kubernetes cluster using Ansible
=================================================
Virtual machines:
Ansible controller ip address
kubernetes master ip address
Two kubernetes nodes

This is called a cluster.

Set up connections
---------------------------
- Start all the VMs
- Copy hosts on all machines and check connections between machines
- On the ansible VM install ansible. Generate ssh key and copy public key file to kubernetes master and node machines.

Create and run playbooks
-----------------
- Create a playbook (example code at https://github.comnetworknuts/ansible-k8s-setup.git)
- navigate to the ansible-k8-setup directory. You will see the following playbooks

Playbooks:
k8s-pkg.yml - this file installs docker and starts docker service, adds kubernetes repo, installs kubectl and kubeadm and starts kubelet service
k8s-master.yml - executed only on master VM. installs kubernetes cluster and crates directory
k8s-workers.yml - creates token for workers to join cluster. Runs the join command on all workers in the cluster

Run playbooks in the above ordr - ansible-playbook <filename>
  
View nodes
----------------
 on master VM enter command kubectl get nodes
