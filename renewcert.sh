#!/bin/bash
DOMAIN="your domain here"
VERSION="your tomcat version number, i.e. 8 or 9"

certbot renew
cp /etc/letsencrypt/live/$DOMAIN/chain.pem /etc/tomcat$VERSION/.
cp /etc/letsencrypt/live/$DOMAIN/cert.pem /etc/tomcat$VERSION/.
cp /etc/letsencrypt/live/$DOMAIN/privkey.pem /etc/tomcat$VERSION/.

# Change the below line if the user that runs tomcat is just "tomcat" instead of also including version number.
chown tomcat$VERSION:tomcat$VERSION /etc/tomcat$VERSION/*.pem
service tomcat$VERSION restart