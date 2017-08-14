#!/usr/bin/env bash

# Argument 1 : stage name (optional)

if [ $# -lt 1 ]; then
    if [ -z "${CI_BRANCH+xxx}" ]; then
        echo 1>&2 "CI_BRANCH is not defined, you need to pass parameter"
        exit 2
    fi

    stage=${CI_BRANCH}
elif [ $# -gt 1 ]; then
    echo 1>&2 "$0: too many arguments"
    exit 2
else
    stage=$1
fi

bundle install
bundle exec cap ${stage} deploy
