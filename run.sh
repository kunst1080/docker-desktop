#!/bin/bash
mkdir -p ~/x11-home/{local,config,work,Downloads,Pictures}
exec docker-compose run --rm dev
