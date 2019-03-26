#!/bin/bash

sudo apt-get update -y && sudo apt-get install -y wget python3 python3-pip
sudo sed -i 's/#Port 22/Port 443/g' /etc/ssh/sshd_config && sudo systemctl restart sshd