#!/bin/bash

sudo apt-get update
sudo apt-get install -y postgresql-client-common
sudo apt-get install -y postgresql-client
sudo apt-get install -y postgresql-client-12
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get install awscli

