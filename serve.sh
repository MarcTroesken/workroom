#!/usr/bin/env bash

# Ask for Sites Name
read -p "Please enter document root: " root
read -p "Please enter sites name: " name

# config stub
block="<VirtualHost *:80>

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/$root/public
    ServerName $name.local

</VirtualHost>
"

# Write it into file
echo "$block" > "/etc/apache2/sites-available/$name.conf"

a2ensite $name.conf
service apache2 restart

echo "--- Page added successfully ---"

# Ask for Database
while true; do
    read -p "Do you wish to create a Db? <y/N> " yn
    echo ""
    case $yn in
        [Yy]* )
            mysql -uroot -proot -e "DROP DATABASE IF EXISTS \`$name\`";
            mysql -uroot -proot -e "CREATE DATABASE \`$name\`";

            echo "--- Database created successfully---"
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done