echo "* Checking for updates.."
sudo apt update -y


echo "* Installing Apache web server.."
sudo apt install -y apache2 libapache2-mod-php bzip2
echo "* Apache Web server installed!"

echo "* Enabling mod_rewrite for nextcloud to function properly.."
sudo a2enmod rewrite
echo "* mod_rewrite succesfully enabled!"

echo "* Enabling additional Apache modules.."
sudo a2enmod headers
sudo a2enmod dir
sudo a2enmod env
sudo a2enmod mime
echo "* Apache Modules succesfully enabled!"


echo "* Restarting apache.."
sudo systemctl restart apache2
echo "* apache succesfully restarted!"


echo "* Downloading and extracting nextcloud files .. "
 
sudo apt install wget -y

cd /var/www/html

wget https://download.nextcloud.com/server/installer/setup-nextcloud.php

sudo chown www-data:www-data /var/www/html/ -R

sudo chmod 775 -R /var/www/html/
sudo systemctl restart apache2

echo "* Done installing nextcloud"

echo "* nextcloud lite installation completed"
echo "* Acces the server by typing <ip>/setup-nextcloud.php in your browser"
echo "* Because the scipt is in beta there might've been a few flaws"
echo "* For now it only uses SQLite, MariaDB Isn't supported yet" 
