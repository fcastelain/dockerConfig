# recreate the bridge
docker network create --subnet=172.20.0.0/16 testNetwork

# start the mysql test data base and the maven container
docker run --net testNetwork --ip 172.20.0.2 -d --name mysqlContainer fcastelain/mysql:latest
docker run --net testNetwork --ip 172.20.0.3 -dti --name mavenContainer fcastelain/maven:latest
docker run --net testNetwork --ip 172.20.0.4 -dti --name tomcatTestContainer fcastelain/tomcat:latest
