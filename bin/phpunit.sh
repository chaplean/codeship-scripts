#!/usr/bin/env bash

# Argument 1 : phpunit type name
# Argument 2 : mysql service

if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

./bin/services-waiting.sh $2

echo "MySQL is launched, we execute PHPUnit"

# Create Doctrine schema if necessary
./bin/console doctrine:schema:create -q -e test > /dev/null

# Reset Elastica database if necessary
./bin/console fos:elastica:reset -e test > /dev/null

# Clear Cache
./bin/console cache:clear -e test > /dev/null

# Launch PHPUnit
./bin/phpunit --configuration ./phpunit-$1.xml --coverage-clover build/logs/clover-$1.xml
