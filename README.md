# my-drupal-project

## Setup


### Initialization
In your `/etc/hosts` file add:

`
192.168.33.10  mydrupalsite.dev
`

Copy the initial seed database from default/database.sql to db/database.sql

Copy default/settings.php to www/sites/default/settings.php

Run `vagrant up --provision`

## Ongoing

To start the site:
`
vagrant up
`

To halt the site
`
vagrant halt
`


To suspend the site
`
vagrant suspend
`

To reprovision your site (using a database dump stored in db/database.sql)
`
vagrant provision
`

## Configuration information
### Default mysql config info
database:  drupal
user:      drupal
password:  drupal

### Drupal default admin user
username:  admin
password:  admin




