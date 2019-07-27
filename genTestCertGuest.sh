#!/bin/bash

# This is meant to be run on the guest machine, if the guest machine runs ansible on itself
cp -r /vagrant/* . # hacky af i know, however: https://github.com/hashicorp/vagrant/issues/10966
dc_domain=$(grep -Po "dc_domain: \K.*" defaults.yml)
dc_domain_top=$(grep -Po "dc_domain_top: \K.*" defaults.yml)
domain="$dc_domain.$dc_domain_top"
cert_loc="/usr/local/share/ca-certificates/fricloudtest.crt"
echo $domain

openssl req -x509 -nodes -subj "/CN=$domain" -keyout roles/certs/files/privkey.pem -out roles/certs/files/cert.crt

echo "# fricloud test script" | sudo tee $cert_loc
cat roles/certs/files/cert.crt | sudo tee $cert_loc
sudo update-ca-certificates

serverip=$(ip route get 1 | awk '{print $NF;exit}')
echo "$serverip $domain" | sudo tee -a /etc/hosts
