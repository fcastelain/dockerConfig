# restart the jenkins and the dind
docker restart jenkinsProdContainer
docker restart jenkinsTestContainer
docker restart dindProdContainer
docker restart dindTestContainer

# restart the dindProdContainer (Tomcat + MySQL)
docker exec dindProdContainer docker rm $(docker exec dindProdContainer docker ps -a -q)
docker exec dindProdContainer docker run --net prodNetwork --ip 172.19.0.2 -dti --name mysqlProdContainer fcastelain/mysql:latest
docker exec dindProdContainer docker run --net prodNetwork --ip 172.19.0.3 -p 8080:8080 -dti --name tomcatProdContainer fcastelain/tomcat:latest

# restart the dindTestContainer (Tomcat + Maven + MySQL)
docker exec dindTestContainer docker rm $(docker exec dindTestContainer docker ps -a -q)
docker exec dindTestContainer docker run --net testNetwork --ip 172.20.0.2 -d --name mysqlContainer fcastelain/mysql:latest
docker exec dindTestContainer docker run --net testNetwork --ip 172.20.0.3 -dti --name mavenContainer fcastelain/maven:latest
docker exec dindTestContainer docker run --net testNetwork --ip 172.20.0.4 -dti --name tomcatTestContainer fcastelain/tomcat:latest
