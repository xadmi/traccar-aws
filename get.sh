#!/bin/bash -e

echo -n "Subdomain: "
read SUBDOMAIN
echo -n "Domain: "
read DOMAIN
echo -n "Email: "
read EMAIL

yum -y install git

rm -rf /tmp/traccar-aws
git clone --depth 1 -b master https://bitbucket.org/xadmi/traccar-aws.git /tmp/traccar-aws
cd /tmp/traccar-aws && ./install.sh ${SUBDOMAIN} ${DOMAIN} ${EMAIL}
