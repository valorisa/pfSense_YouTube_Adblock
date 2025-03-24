#!/bin/sh
# Configure l'inspection SSL avec Squid
CA_NAME="pfSense-SSL-Inspector"
SQUID_CONFIG="/usr/local/etc/squid/squid.conf"

# Crée une autorité de certification
pfsense-certmgr -c create -n "" -t internal

# Configure Squid pour l'interception SSL
echo "http_port 3128 intercept" >> 
echo "https_port 3129 intercept ssl-bump cert=" >> 

# Redémarre Squid
service squid restart
