# create the network of the dind test
docker network create --subnet=172.18.0.0/16 testNetwork

# start to run the jenkins
docker run  -v jenkinsTestConfig:/var/jenkins_home --net testNetwork --ip 172.18.0.2 -dti --name jenkinsTestContainer fcastelain/jenkinstest:latest

# start the dind of test
docker run --net testNetwork --ip 172.18.0.3 -dti --privileged --name dindTestContainer fcastelain/dind:latest

# add the settings file to the dind
docker cp ./setDindTestContainer.sh dindTestContainer:/var/tmp

# run the setting file
docker exec dindTestContainer sh /var/tmp/setDindTestContainer.sh

# create the network of the dind Prod
docker network create --subnet=172.21.0.0/16 prodNetwork

# start to run the jenkins
docker run  -v jenkinsProdConfig:/var/jenkins_home --net prodNetwork --ip 172.21.0.2 -dti --name jenkinsProdContainer fcastelain/jenkinsprod:latest

# start the dind of test
docker run --net prodNetwork --ip 172.21.0.3 -dti --privileged --name dindProdContainer fcastelain/dind:latest

# add the settings file to the dind
docker cp ./setDindProdContainer.sh dindProdContainer:/var/tmp

# run the setting file
docker exec dindProdContainer sh /var/tmp/setDindProdContainer.sh

