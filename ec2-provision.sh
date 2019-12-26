#!/bin/bash -xe

SUBDOMAIN="gps"
DOMAIN="example.com"
EMAIL="john@example.com"

yum -y install git

rm -rf /tmp/traccar-aws
git clone --depth 1 -b master https://bitbucket.org/xadmi/traccar-aws.git /tmp/traccar-aws
cd /tmp/traccar-aws && ./install.sh ${SUBDOMAIN} ${DOMAIN} ${EMAIL}
