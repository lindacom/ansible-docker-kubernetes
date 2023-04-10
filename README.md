Create a new virtual machine in virtualbox.  (You can have one machine for ansible and one machine for docker.  On the network tab
of setting chang the adaptor to bridged to allow connection to the internet and allow ssh between machines)

Installing Ansible
====================
1. sudo apt updat
2. sudo apt install software-properties-common
3. suo add-apt-repository --yes --updata ppa:ansible/ansible
4. sudo apt install ansible

To check the version of ansible:
1. ansible --version (e.g. 2.14.13)

Install community docker extension
==================================
1. ansible-galaxy collection install community docker

Install SSH server
==================
1. sudo apt install openssh-server

To check if SSH is active
1. sudo systemctl status ssh

N.b. if SSH is not nabled enter sudo systemctl enable ssh --now

Test SSH connection
------------------
1. ssh -p 22 user@localhost

N.b. select yes to add localhost to list of known hosts

Networking
==========
1. In virtualbox click tools and click on the haburger icon.  Then go to network and make a note of the IPV4 address.
2. On the ansible machine go to settings >network and set the first adaptor to bridged and the second adaptor to host only adaptor.
Set the ip address the same as the virtual box network you noted in the step above.
3. Start up both ansible and docker machies and open the terminal  Check internet access by entering ping google.com
4. Edit the /etc/hostname file. 

N.b. to get the ip address of a machine enter ifconfig in the terminal. Enpos3 is the first adaptor and Enpos8 is the second adaptor. 
copy the inet address.

5. Edit the /etc/network/interfaces file.

Running Anbible and Docker on one virtual machine
=================================================
If you are unable to establish connection between two VMS (e.g. ot enough emory on the computer) you can install Docker and Ansible
on the same virtual machine 

1. sudo apt install docker

N.b you will need ansible modules for docker.

1. In visual studio code in the VM create a new playbeeok called install_docker.yaml
2. See https://github.com/CristianLempa/boilrplates/ansible/provisioning/ubunt/install-docker.yaml
3. run the playbook ansible-playbook -i inventory install_docker.yaml -t config --ask-pass --ask-become-pass
You should get an ok success message
4. In the terminal enter docker --version to check that it was istalled correctly
5. Enter python3 -m pip list | grep docker
