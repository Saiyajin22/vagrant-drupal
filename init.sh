sudo apt-get update
yes Y | sudo apt-get install apache2
yes Y | sudo apt-get install php libapache2-mod-php mcrypt php-mysql mysql-server
# sudo systemctl start apache2

yes Y | sudo apt-get install mysql-server
# update mysql password
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'password';"

# composer install
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# installs extensions for drupal
yes Y | sudo apt-get install zip unzip php-zip php-curl php-gd php-xml 

# crate drupal project
cd ../../var/www/html
composer create-project drupal/recommended-project vagrant-drupal2
# composer install --no-dev
# composer update
cd ../../..

# configure apache for drupal
echo "ServerName localhost" | sudo tee /etc/apache2/apache2.conf

cat <<EOF | sudo tee /etc/apache2/sites-available/drupal.conf
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/html/vagrant-drupal2
    <Directory /var/www/html/vagrant-drupal2>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF

# Enable the Drupal virtual host and disable the default Apache site.
sudo a2ensite drupal
sudo a2dissite 000-default

# Clean up unnecessary files.
# sudo rm /var/www/html/index.html

# Reload Apache to apply the changes.
# sudo systemctl stop apache2
sudo apachectl start