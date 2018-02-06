#!/bin/bash
#################################################
# bash script to setup and run the ansible script
#################################################
set -x

############################
# STEPS TO BE FOLLOWED ON UBUNTU SYSTEM
# (Done and tested on version UBUNTU 16.02)
############################

#-----------------------------
# STEP 1: DOCKER INSTALLATION
#----------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
apt-cache policy docker-ce

sudo apt-get install -y docker-ce 

#-----------------------------
# STEP 2: ANSIBLE INSTALLATION
#-----------------------------

sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

#------------------------------------------------------------
# STEP 3: REQUIREMENTS FOR ANSIBLE TO COMMUNICATE WITH DOCKER
#------------------------------------------------------------

sudo pip install 'docker-py>=1.7.0'
sudo pip install 'docker-compose>=1.7.0'

#-------------------------------------------------------------------------------
# STEP 4: RUN THE ANSIBLE SCRIPT 
# (This defines docker containers for mysql, wordpress, cadvisor and Prometheus)
#-------------------------------------------------------------------------------

sudo ansible-playbook assignmentAnsible_DivyaBansal.yml

#-------------------------------------------------------------------------------
# STEP 5: VERIFY THE FUNCTIONALITY
# (The following commands will return the IP for the various running docker containers)
#-------------------------------------------------------------------------------

sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' wordpress 

#-------------------------------------------------------------------------------
# Sample Output : 172.17.0.3
# STEP 5a: ACCESS WORDPRESS IN THE BROWSER using 'http://172.17.0.3' 
# (this uses the ip returned by the above command)
#-------------------------------------------------------------------------------

sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' mysql 
#-------------------------------------------------------------------------------
# Sample Output : 172.17.0.2
# STEP 5b: ACCESS MYSQL IN THE BROWSER using 'http://172.17.0.2:3306' 
# (this uses the ip returned by the above command and default port for mysql is 3306)
#-------------------------------------------------------------------------------

sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' cadvisor 

#-------------------------------------------------------------------------------
# Sample Output : 172.17.0.4
# STEP 5c: ACCESS CADVISOR IN THE BROWSER using 'http://172.17.0.4:8080/containers/' 
# (this uses the ip returned by the above command and port 8080 as defined in ansible file)
#-------------------------------------------------------------------------------

sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' prometheus 
#-------------------------------------------------------------------------------
# Sample Output : 172.17.0.5
# STEP 5d: ACCESS PROMETHEUS IN THE BROWSER using 'http://172.17.0.5:9090/targets' 
# (this uses the ip returned by the above command and port 9090 as defined in ansible file)
#-------------------------------------------------------------------------------

