#!/usr/bin/env bash

# Argument 1 : mysql service

if [ $# -lt 1 ]; then
    echo 1>&2 "$0: not enough arguments"
    exit 2
elif [ $# -gt 1 ]; then
    echo 1>&2 "$0: too many arguments"
    exit 2
fi

function test_mysql {
    mysqladmin -h $1 -uroot -proot ping
}

count=0

# Chain tests together by using &&
until ( test_mysql $1 )
do
    ((count++))

    if [ ${count} -gt 100 ]; then
        echo "Services didn't become ready in time"
        exit 1
    fi

    sleep 1.0
done
