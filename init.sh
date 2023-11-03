sudo apt-get update
yes Y | sudo apt-get install apache2
yes Y | sudo apt-get install php libapache2-mod-php mcrypt php-mysql
sudo apachectl start

yes Y | sudo apt-get install mysql-server
# update mysql password
sudo mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
quit

# composer install
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# installs extensions for drupal
yes Y | sudo apt-get install zip unzip php-zip php-curl php-gd php-xml 

# crate drupal project
composer create-project drupal/recommended-project vagrant-drupal2
# composer install --no-dev
# composer update