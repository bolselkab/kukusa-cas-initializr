#!/bin/bash

docker_user="$1"
docker_psw="$2"
echo "$docker_psw" | docker login --username "$docker_user" --password-stdin

imageTag="$3"
if [ -z "$imageTag" ]; then
  version=(`cat gradle.properties | grep "casmgmt.version" | cut -d= -f2`)
  imageTag="v$version" 
fi

echo "Pushing CAS Management docker image tagged as $imageTag to kukusa/cas-management..."
docker push kukusa/cas-management:"$imageTag" \
	&& echo "Pushed kukusa/cas-management:$imageTag successfully.";
