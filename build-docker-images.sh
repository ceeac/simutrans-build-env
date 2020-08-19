#!/bin/sh

for img in $(ls dockerfiles); do
	sudo docker build -t ceeac/simutrans-build-env:$img dockerfiles/$img/
	echo $DOCKER_PASSWORD | sudo docker login -u $DOCKER_USERNAME --password-stdin && sudo docker push ceeac/simutrans-build-env:$img
done
