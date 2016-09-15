Getting started
===============

Install docker and docker-compose for your platform

Configure default settings
==========================

Create a file with the same content of env-devel-local.sh and the modify its content
according to your system.

`````
    export COMPOSE_PROJECT_NAME=buildmachine
    export DOMAIN=local
    export ENV=devel
    export PROXY_PORT=80
`````

You will need to create the folders for JENKINS_HOME_PATH, SONARDB_DATA_PATH, NEXUS_WORK_PATH and
ensure that the current user has read/write access to them.

Applying default settings
=========================

`````
    . env-devel-local.sh
`````

If you create a custom file you will need to apply that file instead of env-devel-local.sh before
building or starting the ecosystem trough docker-compose.

Building
========

`````
    docker-compose build
`````

Starting
========

`````
    docker-compose up -d
`````

Stopping
========

`````
    docker-compose down
`````

Name resolution
===============

In order to access your services by name, modify your dns entries or your /etc/hosts entries like the following entries. (example provided for localhost)

`````
    127.0.0.1 localhost web-devel.local jenkins-devel.local nexus-devel.local sonar-devel.local seleniumhub-devel.local
`````

then you should have access to the following urls:

* http://web-devel.local
* http://seleniumhub-devel.local
* http://sonar-devel.local
* http://nexus-devel.local
* http://jenkins-devel.local

Accessing jenkins for the first time
====================================

When you first access your jenkins host you will be asked for an initial password.

execute the following command to discover the password and choose the installations of the recommended plugins.

`````
    ./show_initial_jenkins_password.sh
`````

Remember that this command needs to be edited if you modify the name of the folder containing docker-compose.yml file.

Customizing
===========

If you want to customize the access urls, you can create another file tha looks like the env-devel-local.sh and you can apply it to the session before building and launching your docker-compose ecosystem.

For instance, if you want your urls look like:

* http://web-prod.mycompany.com:8888
* http://seleniumhub-prod.mycompany.com:8888
* http://sonar-prod.mycompany.com:8888
* http://nexus-prod.mycompany.com:8888
* http://jenkins-prod.mycompany.com:8888

You can create a file env-prod-mycompany.com-8888.sh with the following content:

`````
    export COMPOSE_PROJECT_NAME=buildmachine
    export DOMAIN=mycompany.com
    export ENV=prod
    export PROXY_PORT=8888
`````

And then:

apply that file to the current shell session

`````
    . env-prod-mycompany.com-8888.sh
    docker-compose build
    docker-compose up
`````

do not forget to update your name resolution records

Backup
======

With all the ecosystem started, just issue the following command:

`````
. env-devel-local.sh
./backup_all.sh
`````

This will create a backup folder and within it a folder will be created with the name: YYYY-MM-DD_HHmmss

There three files will be created:

1. jenkins.tar.gz
2. nexus.tar.gz
3. sonar.sql

Restore
=======

In order to simulate a new system, we will stop the current ecosystem and will delete the shared volumes.

`````
. env-devel-local.sh
./stop.sh
./remove_volumes.sh
`````

At this point, before we start a new ecosystem we will restore a saved state:

`````
. env-devel-local.sh
./create_volumes.sh
./restore_all.sh backup/YYYY-MM-DD_HHmmss
`````

Then we can start the system normally:

`````
. env-devel-local.sh
./start.sh
`````

Scale
=====

You can scale services by issuing:

`````
docker-compose scale web=2
`````
