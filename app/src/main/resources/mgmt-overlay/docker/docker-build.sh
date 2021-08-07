#!/bin/bash

imageTag="$1"

if [ -z "$imageTag" ]; then
  version=(`cat gradle.properties | grep "casmgmt.version" | cut -d= -f2`)
  imageTag="v$version" 
fi

echo "Building CAS Management docker image tagged as [$imageTag]"
# read -p "Press [Enter] to continue..." any_key;

docker build --tag="kukusa/cas-management:$imageTag" . \
  && echo "Built CAS Management image successfully tagged as kukusa/cas-management:$imageTag" \
  && docker images "kukusa/cas-management:$imageTag"
