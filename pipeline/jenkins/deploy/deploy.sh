#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth prod-user@deployment:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish prod-user@deployment:/tmp/publish
ssh -i /opt/prod prod-user@deployment "/tmp/publish"
