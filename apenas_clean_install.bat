cd ..
cd .\collie.account\
mvn clean install
cd ..
cd .\collie.account-resource\
mvn clean package
cd ..
cd .\collie.auth\
mvn clean install
cd ..
cd .\collie.auth-resource\
mvn clean package
cd ..
cd .\collie.discovery\
mvn clean install
cd ..
cd .\collie.gateway\
mvn clean install
cd ..
cd .\collie.service\
mvn clean install
cd ..
cd .\collie.service-resource\
mvn clean package
cd ..
cd .\collie.squad\
mvn clean install
cd ..
cd .\collie.squad-resource\
mvn clean package
cd ..
cd .\collie.company\
mvn clean install
cd ..
cd .\collie.company-resource\
mvn clean package
cd ..
cd .\collie.docker-api\
docker-compose up -d --build


