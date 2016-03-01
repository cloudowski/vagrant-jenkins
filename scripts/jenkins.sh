#!/bin/bash

echo ":: Installing jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-rc/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-rc/jenkins-ci.org.key

yum install -y java-1.8.0-openjdk.x86_64 jenkins

echo ":: Disabling AJP configuration"
# disable ajp
sed -i -e 's/^\(JENKINS_AJP.*\)/#\1/' /etc/sysconfig/jenkins

echo ":: Disabling firewalld service"
# disable firewalld
systemctl stop firewalld
systemctl disable firewalld

echo ":: Enabling and starting jenkins service"
systemctl enable jenkins
systemctl start jenkins

