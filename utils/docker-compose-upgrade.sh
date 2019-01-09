#!/bin/sh
set -e

sudo apt-get remove docker-compose
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
echo "Last version is "$VERSION
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod +x $DESTINATION
docker-compose -v
