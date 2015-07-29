#!/bin/bash

heap=$1
pkill -f 'java -server'
java -server -Xmx$heap -Dbigdata.propertyFile=/opt/blazegraph/RWStore.properties -jar /opt/blazegraph/bigdata-bundled.jar
