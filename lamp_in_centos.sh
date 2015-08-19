#!/bin/bash
#
# Created By:- Fahad Ahammed
# www.obakfahad.com
#
echo "------------------------------"
echo "Welcome to LAMP installation script in CentOS created by Fahad Ahammed. (fahad.space)"
echo "------------------------------"
ip=$(ip addr | grep global | awk '{print $2}' | awk '{print substr($0, 0, length($0)-2)}')
yum update
yum install httpd -y
systemctl enable httpd
yum install php -y
systemctl start httpd
yum install php-mysql mariadb mariadb-server -y
systemctl enable mariadb
systemctl start mariadb
mysql_secure_installation
yum install phpmyadmin -y
sed -i '16i Require all granted' /etc/httpd/conf.d/phpMyAdmin.conf
sed -e '17,18d' /etc/httpd/conf.d/phpMyAdmin.conf
systemctl restart httpd
echo "------------------------------"
echo "To access phpMyAsmin: http://$ip/phpmyadmin"
echo "------------------------------"
