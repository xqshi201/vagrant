#!/bin/bash
echo "root password is :123456"
sudo sleep 5s
echo "123456" | sudo passwd root --stdin
sudo yum update -y
sudo yum install -y  kernel-devel
sudo systemctl stop firewalld
sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo service sshd restart


