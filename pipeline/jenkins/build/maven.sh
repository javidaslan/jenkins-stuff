#!/bin/bash

echo "**********************************"
echo "********* Building jar ***********"
echo "**********************************"

docker run --rm -v $PWD/java-app:/app -v /root/.m2:/root/.m2 maven:3-alpine -w /app mvn "$@"