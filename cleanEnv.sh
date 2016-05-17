# stop all the docker
docker stop $(docker ps -q)

# remove the network
docker network rm $(docker network ls -q)

# remove the container
docker rm $(docker ps -a -q)

# remove the images
docker rmi $(docker images -q)

# clean the volume
docker volume rm $(docker volume ls -qf dangling=true)
