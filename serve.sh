#!/usr/bin/env bash

# Ask for Sites Name
read -p "Please enter sites name: " input

# config stub
block="<VirtualHost *:80>

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/$input/public
    ServerName $input.local

</VirtualHost>
"

# Write it into file
echo "$block" > "/etc/apache2/sites-available/$input.conf"

a2ensite $input.conf
service apache2 restart

echo "--- Page added successfully ---"

# Ask for Database
while true; do
    read -p "Do you wish to create a Db? <y/N> " yn
    echo ""
    case $yn in
        [Yy]* )
            mysql -uroot -proot -e "DROP DATABASE IF EXISTS \`$input\`";
            mysql -uroot -proot -e "CREATE DATABASE \`$input\`";

            echo "--- Database created successfully---"
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done