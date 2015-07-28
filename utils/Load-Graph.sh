#!/bin/bash

cmd=$1
curl -XPOST --data-urlencode "$cmd" http://localhost:9999/bigdata/sparql

