Runing mysql Docker container with Ansible
============================================

1. Create a .yml file called mysqldocker.yml
2. Paste the playbook code in the file and save. N.b. (hosts:all remote user:ubuntu)
3. Run the playbook ansible-playbook -i inventory mysqldocker.yml --ask-pass --ask-become-ass
4. Enter docker ps to display running containers

Nb. you should see a running container with the name and port specified

Nb. to create other containers just change image and settings relevant to that container

Tutorials
--------------
https://www.youtube.com/watch?v=yT8QFKqcSBg
