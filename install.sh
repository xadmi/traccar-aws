#!/bin/bash -e

sudo yum -y update
sudo yum -y install python2-pip
sudo pip install ansible==2.8.7

sudo ansible-playbook --connection=local -i "localhost," ansible/prepare-server.yml
sudo ansible-playbook --connection=local -i "localhost," ansible/install-traccar.yml

if [[ $TC_LETSENCRYPT == true ]]; then
  sudo ansible-playbook --connection=local -i "localhost," ansible/install-letsencrypt.yml
fi
