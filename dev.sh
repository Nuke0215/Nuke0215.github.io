#!bin/bash

docker build -t hugo-dev --target=dev .
docker run -p 1313:1313 -v $(pwd):/app --rm hugo-dev
