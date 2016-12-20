#!/bin/sh

sudo apt-get update
sudo apt-get install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker

sudo usermod -aG docker suker
sudo service docker restart


