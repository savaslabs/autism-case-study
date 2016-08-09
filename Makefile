make travis:
	-if [ -f www/sites/default/settings.php ]; then chmod -Rf 777 www/sites/default; fi;
	-cp default/settings.php www/sites/default/settings.php
	-chmod 700 www/sites/default/settings.php
	make stop
	make build
	make up
	sleep 5
install:
	make travis
	make initialize
	-docker-compose ps
build:
	-docker-compose pull
	-docker-compose build
up:
	-docker-compose up -d
	-docker-compose ps
stop:
	-docker-compose down
refresh:
	make db -B
db:
	-docker exec -it autismcasestudy_mariadb_1 /bin/sh -c "mysql -u drupal -pdrupal drupal < /docker-entrypoint-initdb.d/database.sql"
clean:
	make stop
	-docker rm $(docker-compose ps -q)
	-docker-compose ps
initialize:
	make initialize-alias
	make refresh
	make initialize-travis
initialize-travis:
	-set -e; docker-compose exec --user 82 php drush @dev updb
	-set -e; docker-compose exec --user 82 php drush @dev fra -y
	-set -e; docker-compose exec --user 82 php drush @dev cc all
	-set -e; docker-compose exec --user 82 php drush @dev cc all
	-set -e; docker-compose exec --user 82 php drush @dev pm-enable acs_master -y
	-docker-compose ps
initialize-testing:
	-set -e; docker-compose exec --user 82 php /bin/sh -c "cd /var/www/html/tests; composer install; bin/behat --init"
	-set -e; docker-compose exec --user 82 php tests/bin/phpcs --config-set installed_paths /var/www/html/tests/vendor/drupal/coder/coder_sniffer
update-testing:
	-set -e; docker-compose exec --user 82 php /bin/sh -c "cd /var/www/html/tests; composer update; bin/behat --init"
initialize-alias:
	-set -e; docker-compose exec --user 82 php /bin/sh -c "cp /var/www/html/default/drush/wodby.aliases.drushrc.php ~/.drush/wodby.aliases.drushrc.php"
test:
	-set -e; docker-compose exec --user 82 php tests/bin/behat -c tests/behat.yml
phpcs:
	-set -e; docker-compose exec --user 82 php tests/bin/phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme www/sites/all/modules/custom --ignore=*.css,*.min.js,*addthis_widget.js,*features.*.inc
