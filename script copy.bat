cd ..
cd .\collie.account\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.account-resource\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean package
cd ..
cd .\collie.auth\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.auth-resource\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean package
cd ..
cd .\collie.discovery\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.gateway\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.service\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.service-resource\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean package
cd ..
cd .\collie.squad\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.squad-resource\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean package
cd ..
cd .\collie.company\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean install
cd ..
cd .\collie.company-resource\
git pull
git add .
git commit -m "update jenkins"
git push
mvn clean package
cd ..
cd .\collie.docker-api\
git pull
git add .
git commit -m "update jenkins"
git push


