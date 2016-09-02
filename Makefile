
all: install

install:
	- make up
	- docker-compose exec php /bin/sh -c "chown -Rf www-data:www-data /var/www/html"
	- docker-compose exec --user 82 php /bin/sh -c "cp /var/www/html/default/settings.php /var/www/html/www/sites/default/settings.php"
	- docker-compose exec --user 82 php /bin/sh -c "ls -l; cd tests; composer install"
	- docker-compose exec -T --user 82 php tests/bin/phpcs --config-set installed_paths /var/www/html/tests/vendor/drupal/coder/coder_sniffer
	- make provision

provision:
	- docker-compose exec --user 82 php drush @dev updb -y
	- docker-compose exec --user 82 php drush @dev cc all
	- docker-compose exec --user 82 php drush @dev pm-enable acs_master -y
	- docker-compose exec --user 82 php drush @dev fra -y        
	- docker-compose exec --user 82 php drush @dev wd-del all -y
	- docker-compose ps

update-tests:
	- docker-compose exec --user 82 php /bin/sh -c "cd /var/www/html/tests; composer update; bin/behat --init"

test:
	- make phpcs
	- docker-compose exec --user 82 php tests/bin/behat -c tests/behat.yml

phpcs:
	- docker-compose exec --user 82 php tests/bin/phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme tests/features www/sites/all/modules/custom --ignore=*.css,*.min.js,*addthis_widget.js,*features.*.inc

clean:
	make stop
	- docker rm $(docker-compose ps -q)
	- docker-compose ps

clean-data:
	- docker volume rm autismcasestudy_mysql-data

stop:
	- docker-compose down

up:
	- docker-compose up -d
