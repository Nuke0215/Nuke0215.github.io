#!bin/bash

docker build -t hugo-prod --target=prod .
docker run -p 8080:80 --rm hugo-prod
