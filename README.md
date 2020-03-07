# Tomcat configurations
I use the Tomcat server mainly for Apache Guacamole. I thought it was time to put some config files up so that I don't have to copy them from other servers all the time. When setting up guacamole, I usually use guac-install.sh from MysticRyuujin with MFA (-t flag), would highly recommend this script to anyone setting up guacamole, whether beginner or experienced.

## server.xml
The config file belongs in /etc/tomcat{VERSION}/server.xml. This is set up to run SSL/TLS on port 8443. If you are portforwarding to a server (so you're behind NAT), you can forward external 443 to internal 8443 for ease of use. If you try and run the connector on port 443, make sure your tomcat user has the permissions to bind to that port. Copy this file to the relevant directory as was listed earlier on before running the next command.

## renewcert.sh
This renews a cert that you have already created with certbot. If you just create the certs using certbot and their standalone webserver successfully, you can then run this command after changing the domain and version variables, domain being your domain name and version being the version of tomcat. Make any edits that you need to, such as the username for tomcat, etc. After running it, you should see that you have valid certs when accessing tomcat via the domain name on port 443 (if doing fun portforwarding rules) or 8443. Accessing directly by IP will give a cert error still, but you can view the certificate, and if it is working, it should be for your domain.

