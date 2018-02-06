#--------------------------
# ASSIGNMENT TO DO
#--------------------------

# Using a language of your choice, 
# write a script to set up a Wordpress & monitoring server,
# and share the script for further discussion."

###########################################
Files provided:
###########################################

1. assignment_DivyaBansal.sh (To be run if docker ad ansible are not already present on the system)
Bash script that installs docker , ansible on the system.
This then runs the ansible script that sets up wordpress & the monitoring Server.

2. assignmentAnsible_DivyaBansal.yml (If, Docker and ansible are already present on the system, this script can be directly run)
Ansible Script that sets up wordpress, mysql , cadvisor and Prometheus docker containers.

3. cleanDockerImages.sh
Bash Script to clean existing docker images , containers and volumnes mounted, if any


###########################################
# STEPS TO BE FOLLOWED ON UBUNTU SYSTEM
# (Done and tested on version UBUNTU 16.02)
###########################################

#		STEP 1:
#------------------------------------------------
CASE 1: IF Docker and ANsible are present on the system:
	
	# Run assignmentAnsible_DivyaBansal.yml
	$ sudo ansible-playbook assignmentAnsible_DivyaBansal.yml

CASE 2: IF Docker ans Ansible are not present on the system:

	# Run assignment_DivyaBansal.sh
	$ bash assignment_DivyaBansal.sh
 

#		STEP 2: 
#------------------------------------------------

Run the various containers in the browser as per the IPs obtained after successful
completion of the above script.

#-------------------------------------------------------------------------------
# VERIFY THE FUNCTIONALITY
# (The following commands will return the IP for the various running docker containers)
#-------------------------------------------------------------------------------

$ sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' wordpress
# Sample Output : 172.17.0.3
# STEP 5a: ACCESS WORDPRESS IN THE BROWSER using 'http://172.17.0.3' 
# (this uses the ip returned by the above command)
#-------------------------------------------------------------------------------

$ sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' mysql
# Sample Output : 172.17.0.2
# STEP 5b: ACCESS MYSQL IN THE BROWSER using 'http://172.17.0.2:3306' 
# (this uses the ip returned by the above command and default port for mysql is 3306)
#-------------------------------------------------------------------------------

$ sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' cadvisor
# Sample Output : 172.17.0.4
# STEP 5c: ACCESS CADVISOR IN THE BROWSER using 'http://172.17.0.4:8080/containers/' 
# (this uses the ip returned by the above command and port 8080 as defined in ansible file)
#-------------------------------------------------------------------------------

$ sudo docker inspect --format '{''{ .NetworkSettings.IPAddress }''}' prometheus
# Sample Output : 172.17.0.5
# STEP 5d: ACCESS PROMETHEUS IN THE BROWSER using 'http://172.17.0.5:9090/targets' 
# (this uses the ip returned by the above command and port 9090 as defined in ansible file)
#-------------------------------------------------------------------------------

