# autism-case-study
Drupal 7 case study site, which is an informational site for Autism.  This is Ro Wang's Learning Site.

The docker container portion of this project is based on large part on the Wodby Docker4Drupal project, available at https://github.com/Wodby/docker4drupal

## Setup


### Initialization
In your `/etc/hosts` file add:

`
127.0.0.1  mydrupalsite.dev
`

* Run `make install`
* If the drush alias file does not copy properly (all of the drush steps will throw an error), run `make initialize`.

## Ongoing

To start the site:
`
make up
`

To halt the site:
`
make down
`

To reprovision your site (using a database dump stored in db/database.sql):
`
make install
`

If all containers are not in the "up" state, then:
`
make up
`

To halt the containers:
`
make stop
`

To remove the containers:
`
make clean
`

To shell into the server:
`
docker-compose exec --user 82 php /bin/sh
`

To reinitialize your drupal site (run the drush provisioning commands):
`
make initialize
`

To initialize the behat testing environment:
`
make initialize-testing
`

To run tests:
`
make test
`

To refresh the database:
`
make refresh
`

To build containers again:
`
make build
`

### MySQL Credentials:

* database:  drupal
* user:      drupal
* password:  drupal

### Drupal default admin user

* username:  admin
* password:  admin
