#!/bin/bash

imageTag="$1"

if [ -z "$imageTag" ]; then
  version=(`cat gradle.properties | grep "cas.version" | cut -d= -f2`)
  imageTag="v$version" 
fi

echo "Building CAS docker image tagged as [$imageTag]"
# read -p "Press [Enter] to continue..." any_key;

docker build --tag="kukusa/cas:$imageTag" . \
  && echo "Built CAS image successfully tagged as kukusa/cas:$imageTag" \
  && docker images "kukusa/cas:$imageTag"