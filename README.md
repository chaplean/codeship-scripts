Getting Started With Chaplean Continuous Integration Scripts
==============================================

This bundles installs some scripts in your bin/ repositories usable with Codeship/Gitlab/...

## Scripts

1. deploy.sh : deploy on server using Capistrano.
1. deploy-htaccess.sh : if you have a htpasswd on htaccess file you want to deploy only on some environments, use this script.
1. services-waiting.sh : wait until MySQL is launched. Usefull when you have two docker containers and you need to wait for a specific service. 
1. phpunit.sh : launch phpunit tests (with availability to parallelize tests and merge coverage) after MySQL has been launched.
