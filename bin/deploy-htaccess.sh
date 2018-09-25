#!/usr/bin/env bash

_pwd=`pwd`
file='public/.htaccess.deploy'

function help {
    printf "Use deploy-htaccess:\n"
    printf "\t --env prod|preprod|dev (default: prod) Define environnement\n"
    printf "\t --htpasswd true|false (default: false) Enable htpasswd\n"
    exit 0
}

if [ $# -eq 0 ]
then
    help
fi

function htpasswd() {
    pwd=${_pwd//\//\\/}

    sed 's/#%allowhtpasswd%//g' $file > 'public/.htaccess'
    file='public/.htaccess'
    sed -i 's/%htpasswd%/'$pwd'\/public/g' $file
}

function deploy() {
    if [[ $file =~ 'deploy' ]]
    then
        sed 's/%_env%/'$_env'/g' $file > 'public/.htaccess'
        file='public/.htaccess'
    else
        sed -i 's/%_env%/'$_env'/g' $file
    fi

    sed -i 's/%env%/'$env'/g' $file
}

function checkOption() {
    if [[ $2 =~ '--' ]]
    then
        printf "Invalid value for option $1\n"
        exit 1;
    fi
}

_env=''
env='prod'

while [[ $# > 1 ]]
do
    key="$1"

    case $key in
        -e|--env)
            checkOption $key $2
            case $2 in
                'preprod'|'dev')
                    _env="_$2"
                    env="preprod"
                    ;;
                'prod')
                    _env=''
                    env='prod'
                    ;;
                *)
                printf "Unknow $2 environement\n"
                exit 1;
                ;;
            esac
            shift # past argument
            ;;
        -hp|--htpasswd)
            checkOption $key $2
            if [[ $2 == 'true' ]]
            then
                htpasswd
            fi
            shift # past argument
            ;;
        *)
            shift
            ;;
    esac
done

deploy

exit 0
