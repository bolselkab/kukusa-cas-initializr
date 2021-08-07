#!/bin/bash

docker stop kukusa-cas-management > /dev/null 2>&1
docker rm kukusa-cas-management > /dev/null 2>&1
image_tag=(`cat gradle.properties | grep "casmgmt.version" | cut -d= -f2`)
docker run -d -p 8080:8080 -p 8443:8443 --name="kukusa-cas-management" kukusa/cas-management:"v${image_tag}"
docker logs -f kukusa-cas-management
