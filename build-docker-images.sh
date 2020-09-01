#!/bin/sh

for img in $(ls dockerfiles); do
	sudo docker build -t ceeac/simutrans-build-env:$img dockerfiles/$img/
	echo $DOCKER_PASSWORD | sudo docker login -u ceeac --password-stdin && sudo docker push ceeac/simutrans-build-env:$img; sudo docker logout
done
