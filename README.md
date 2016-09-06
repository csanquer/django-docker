Docker Compose config for Django development
============================================

Requirements
------------

* Docker >= 1.10
* docker-compose >= 1.7
* acl for permissions on linux
* GNU make

Install
-------

1. clone your django application in volumes/apps/app

```sh
git clone <git-url> volumes/apps/app
```

2. build the docker container images

```sh
make install
```

3. run any django manage.py command with the `run.sh` wrapper script

```sh
# run python manage.py  migrations commands in run-off containers
./run.sh makemigrations
./run.sh migrate
```

4. run the docker containers in background

```sh
make up
```

The django application is listening on http://localhost:8000/.

The phppgadmin on http://localhost:8080/phppgadmin/ :
default Database user (in docker-composer.yml config):
* username = pguser
* password = pgpass
