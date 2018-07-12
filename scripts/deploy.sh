#!/usr/bin/env bash

mvn clean package

echo 'Copy fies...'

scp -i ~/.ssh/id_rsa_drucoder \
    target/treater-1.0-SNAPSHOT.jar \
    jharvard@192.168.56.101:/home/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa_drucoder jharvard@192.168.56.101 <<E0F

pgrep java | xargs kill -9
nohup java -jar treater-1.0-SNAPSHOT.jar >log.txt &

E0F

echo 'Bye'