Getting Started With Chaplean Codeship Scripts
==============================================

This bundles installs some scripts in your bin/ repositories usable with Codeship.

## Scripts

1. services-waiting.sh : wait until MySQL is launched. Usefull when you have two docker containers and you need to wait for a specific service. 
1. phpunit.sh : launch phpunit tests (with availability to parallelize tests and merge coverage) after MySQL has been launched.
