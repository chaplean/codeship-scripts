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

./bin/phpunit --configuration ./phpunit-$1.xml --coverage-clover build/logs/clover-$1.xml
