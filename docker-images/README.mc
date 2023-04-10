Build Docker images with Ansible
=========================================

Create a Docker image from a dockerfile
========================================
1. Create a new directory - in virtualbox in the Documents directory clone the repository - 
gitclone https://github.com/joeterlecki/docker-images-with-ansible. Navigate to this directory which contains a 
sub directory called docker-build.  This sub directory includes a dockerfile.
2. Create a docker image - in the docker-build directory run docker build docker-build -t nginx-docker-build-demo
to build a docker image from the docker file.
3. Run the docker image - enter docker run -it --rm -d -p 8080:80 --name web-server-docker nginx-docker-build-demo

N.b. -it means interactively.  --rm means remove on exit. -d means detatch so you can still run the terminal. -p means port
8080:80 means assign port 8080 to 80 on host. nginx-docker-build-demo is the image this running image is based on.
