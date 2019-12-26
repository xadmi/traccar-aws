#!/bin/bash

SUBDOMAIN="${1}"
DOMAIN="${2}"
EMAIL="${3}"

sudo yum -y update
sudo yum -y install python2-pip
sudo pip install ansible==2.8.7

cd /tmp/ansible && sudo ansible-playbook --connection=local -i "localhost," \
                                         -e "SUBDOMAIN=${SUBDOMAIN}" \
                                         -e "DOMAIN=${DOMAIN}" \
                                         -e "EMAIL=${EMAIL}" \
                                         install-traccar.yml
