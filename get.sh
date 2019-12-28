#!/bin/bash -e

if [[ $1 == "--no-le" ]]; then
  export TC_LETSENCRYPT=false
else
  export TC_LETSENCRYPT=true
fi

if [[ $TC_LETSENCRYPT == true ]]; then
  if [[ -z "$TC_DOMAIN" || -z "$TC_EMAIL" ]]; then
    echo -n "Domain: "
    read TC_DOMAIN && export TC_DOMAIN
    echo -n "Email: "
    read TC_EMAIL && export TC_EMAIL
  fi
fi

yum -y install git

rm -rf /tmp/traccar-aws
git clone --depth 1 -b master https://bitbucket.org/xadmi/traccar-aws.git /tmp/traccar-aws
cd /tmp/traccar-aws && ./install.sh
