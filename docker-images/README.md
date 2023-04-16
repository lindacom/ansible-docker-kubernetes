You can eithr create a docker image from the commandline or use an automation tool such as Ansible.

Create a Docker image from a dockerfile
========================================
1. Create a new directory - in virtualbox in the Documents directory clone the repository - 
gitclone https://github.com/joeterlecki/docker-images-with-ansible. Navigate to this directory which contains a 
sub directory called docker-build.  This sub directory includes a dockerfile.The dockerfile is used to create an image
2. Create a docker image - in the docker-build directory run docker build docker-build -t nginx-docker-build-demo
to build a docker image from the docker file.
3. Run the docker image - enter docker run -it --rm -d -p 8080:80 --name web-server-docker nginx-docker-build-demo

N.b. -it means interactively.  --rm means remove on exit. -d means detatch so you can still run the terminal. -p means port
8080:80 means assign port 8080 to 80 on host. nginx-docker-build-demo is the image this running image is based on.

N.b. running an image creates and starts container.

4. In the browser enter localhost:8080 you should see a webpage
5. in the terminal enter docker ps to see standard docker file that has website running

Build Docker images with Ansible
=========================================
Recreate a website using a docker image from Ansible.

1. In the Documents/docker-images-with-ansible directory run ansible-playbook docker-image-playbook.yaml to create an image.
2. Enter docker images command to see the image in the list
3. Run the docker image - docker run -it --rm -d -p 8081:80 --name web-server-ansible nginx-ansible-build-demo
4. Go to localhost:8081 to see the website.

Files
=====
/Documents/docker-images-with-ansible

Docker commands
===============
docker ps
docker images

Tutorials
=========
How to build docker images with ansible - https://www.youtube.com/watch?v=kkazBPHc4bk
