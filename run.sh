#!/bin/bash

cmd=''
if [ $# -gt 0 ]; then
    cmd="$@"
fi

docker-compose run --rm webapp python manage.py $cmd
