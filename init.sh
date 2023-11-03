sudo apt-get update
yes Y | sudo apt-get install apache2
yes Y | sudo apt-get install php8.1 libapache2-mod-php mcrypt php8.1-mysql mysql-server
# sudo systemctl start apache2

# install mysql-server and update mysql password
yes Y | sudo apt-get install mysql-server
# sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'root';"

# composer install
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# installs extensions for drupal
yes Y | sudo apt-get install zip unzip php8.1-zip php-curl php8.1-gd php8.1-xml php8.1-simplexml php8.1-dom

# crate drupal project
cd ../../var/www/html
composer create-project drupal/recommended-project vagrant-drupal2
# composer install --no-dev
# composer update
# Fix errors to enable creation of drupal project
sudo chmod -R 777 vagrant-drupal2
cd vagrant-drupal2/web/sites/default
sudo cp default.settings.php settings.php
sudo chmod 777 settings.php
sudo mkdir files
sudo chmod -R 777 files

# create database
mysql -u root -e "CREATE DATABASE vagrant CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
mysql -u root -e "SHOW DATABASES;";

# configure apache for drupal
# echo "ServerName localhost" | sudo tee /etc/apache2/apache2.conf

# cat <<EOF | sudo tee /etc/apache2/sites-available/drupal.conf
# <VirtualHost *:80>
#     ServerName localhost
#     DocumentRoot /var/www/html/vagrant-drupal2
#     <Directory /var/www/html/vagrant-drupal2>
#         AllowOverride All
#         Require all granted
#     </Directory>
# </VirtualHost>
# EOF

# Enable the Drupal virtual host and disable the default Apache site.
# sudo a2ensite drupal
# sudo a2dissite 000-default

# Clean up unnecessary files.
# sudo rm /var/www/html/index.html

# Start apache2 server
# sudo systemctl stop apache2
sudo apachectl start