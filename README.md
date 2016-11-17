# autism-case-study
Drupal 7 case study site, which is an informational site for Autism.  This is Ro Wang's Learning Site.

The docker container portion of this project is based on large part on the Wodby Docker4Drupal project, available at https://github.com/Wodby/docker4drupal

[![Build Status](https://travis-ci.org/savaslabs/autism-case-study.svg?branch=develop)](https://travis-ci.org/savaslabs/autism-case-study)

## Setup


### Initialization
In your `/etc/hosts` file add:

`
127.0.0.1  mydrupalsite.dev
`

* Run `make install`

## Ongoing

To start the site:
`
make up
`

To halt the site:
`
make stop
`

To reprovision your site (using a database dump stored in db/database.sql):
`
make install
`

If all containers are not in the "up" state, then:
`
make up
`

To remove the containers:
`
make clean
`

To remove the data container (where the database is stored):
`
make clean-data
`

To shell into the php container:
`
docker-compose exec --user 82 php /bin/sh
`
- Furthermore, to execute Drush commands in the php container, navigate to: `/var/www/html/www`

To shell into the mySQL container:
`
docker-compose exec mariadb /bin/sh
`

To reinitialize your drupal site (run the drush provisioning commands):
`
make provision
`

To run tests:
`
make test
`

To updates tests for changes in behat.yml
`
make update-tests
`

### MySQL Credentials:

* database:  drupal
* user:      drupal
* password:  drupal

### Drupal default admin user

* username:  admin
* password:  admin