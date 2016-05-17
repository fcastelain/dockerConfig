# use to run the test
# remove the old version
rm -Rf cdb

# dl the git
git clone https://github.com/fcastelain/computer-database.git cdb

# remove the old version and copy the project to the maven docker
docker exec mavenContainer rm -Rf /var/tmp/cdb
docker cp cdb mavenContainer:/var/tmp

# launche the maven test
docker exec mavenContainer mvn -f /var/tmp/cdb/ test 

#use to deploy the tomcat
# remove the old version
rm -Rf cdb

# dl the git
git clone https://github.com/fcastelain/computer-database.git cdb

# remove the old version and copy the project to the maven docker
docker exec mavenContainer rm -Rf /var/tmp/cdb
docker cp cdb mavenContainer:/var/tmp

# launche the build
docker exec mavenContainer mvn -f /var/tmp/cdb/pom.xml clean install -DskipTests

# get the war
docker cp mavenContainer:/var/tmp/cdb/target/cdb-0.1.1-SNAPSHOT.war cdb/cdb.war
docker cp cdb/cdb.war tomcatTestContainer:/usr/local/tomcat/webapps/cdb.war

# push the new version to docker hub
docker login --username=fcastelain --password=azerty
docker commit tomcatTestContainer fcastelain/tomcat:latest
docker push fcastelain/tomcat:latest

# deploy solution
# redeploy the tomcat server with the new image
docker stop tomcatProdContainer
docker rm tomcatProdContainer
docker rmi fcastelain/tomcat
docker run --net prodNetwork --ip 172.19.0.3 -dti --name tomcatProdContainer fcastelain/tomcat:latest
