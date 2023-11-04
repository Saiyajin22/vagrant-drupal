# vagrant-drupal2
This project provides a Vagrantfile which sets up a drupal development environment for you, with a MySQL database. This project is made for the SZTE course: Cloud and DevOps basics

This project creates a new drupal project for you, under var/www/html/vagrant-drupal2 - To start the vagrant setup process, go to localhost:8080/vagrant-drupal2/web

## A MySQL database is created for you. 
- DatabaseName: vagrant
- Database username: root
- Database password: root

## Little issue currently in the vm
There's a little problem, that when you finish the drupal site's setup process, styles are not loaded, so the page is like if it was written in pure html, and some links / buttons are not working. Currently i was unable to identify the cause of this problem.