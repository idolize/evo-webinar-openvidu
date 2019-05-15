#!/bin/bash

# Script to get cert files from LetsEncrypt for AWS.
# Meant to be run locally from a dev machine.

# See here for more info: https://hackernoon.com/easy-lets-encrypt-certificates-on-aws-79387767830b
# Related article about DNS: http://techgenix.com/namecheap-aws-ec2-linux/

# TODO factor out email and domain into cmdline args

# Use Let's Encrypt certbot to order a free certificate
certbot certonly --non-interactive --manual \
  --manual-auth-hook "./auth-hook.sh UPSERT idol.software" \
  --manual-cleanup-hook "./auth-hook.sh DELETE idol.software" \
  --preferred-challenge dns \
  --config-dir "./letsencrypt" \
  --work-dir "./letsencrypt" \
  --logs-dir "./letsencrypt" \
  --agree-tos \
  --manual-public-ip-logging-ok \
  --domains idol.software,evo.idol.software \
  --email david.idol@gmail.com
