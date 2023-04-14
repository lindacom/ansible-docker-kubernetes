Use Ansible to update and patch Linux system
=============================================

1. Enter the IP addresses of the servers you want to run updates on in the etc/ansible/hosts file
2. Create a playbook file. In the hosts key entr the group name of the hosts
3. run the playbook - ansible-playbook <filename>
  
N.b. Ansible uses SSH to connect to servers.
