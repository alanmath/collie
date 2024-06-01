cd ..
cd ./collie.account/
mvn clean install
git pull
cd ..
cd ./collie.account-resource/
mvn clean package
git pull
cd ..
cd ./collie.auth/
mvn clean install
git pull
cd ..
cd ./collie.auth-resource/
mvn clean package
git pull
cd ..
cd ./collie.discovery/
mvn clean install
git pull
cd ..
cd ./collie.gateway/
mvn clean install
git pull
cd ..
cd ./collie.service/
mvn clean install
git pull
cd ..
cd ./collie.service-resource/
mvn clean package
git pull
cd ..
cd ./collie.squad/
mvn clean install
git pull
cd ..
cd ./collie.squad-resource/
mvn clean package
git pull
cd ..
cd ./collie.company/
mvn clean install
git pull
cd ..
cd ./collie.company-resource/
mvn clean package
git pull
cd ..
cd ./collie.docker-api/
docker-compose up -d --build


