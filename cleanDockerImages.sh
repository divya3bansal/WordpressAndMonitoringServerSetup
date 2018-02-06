# Script to clean existing docker images and volumes mounted, to be able to start afresh 
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -f dangling=true -q)
sudo docker volume rm $(sudo docker volume ls -f dangling=true -q)
