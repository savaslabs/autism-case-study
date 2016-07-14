# my-drupal-project

## Setup
In your `/etc/hosts` file add:

`
192.168.33.10  mydrupalsite.dev
`

To start the site:
`
vagrant up --provision
`

To halt the site
`
vagrant halt
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




