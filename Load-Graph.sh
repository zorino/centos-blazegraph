#!/bin/bash

cmd=$1
sudo docker exec e5c26e6bc484 curl -XPOST --data-urlencode "$cmd" http://localhost:9999/bigdata/sparql


