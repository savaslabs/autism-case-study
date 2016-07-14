# autism-case-study
Drupal 7 case study site, which is an informational site for Autism.  This is Ro Wang's Learning Site.
<<<<<<< HEAD

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

To restart phantomjs

* Shell into the server (`vagrant ssh`)
* Navigate to /var/www/sites/drupal/
* Execute `/default/start-phantomjs`

## Configuration information
### Default mysql config info
database:  drupal
user:      drupal
password:  drupal

### Drupal default admin user
username:  admin
password:  admin




=======
>>>>>>> dc7fc848119947332ee0569476e74748b5f1b760
